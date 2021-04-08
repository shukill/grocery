import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/src/styles/colors.dart';

const double _KDefaultButtonSize = 30;
const double _KDefaultSpace = 8;
const double _KDefaultTextFontSize = 14;

/// VxStepper widget to have a input enabled counter with 2 buttons, one for addition and one for subtraction with good level of customization.
class MyStepper extends StatefulWidget {
  final num defaultValue;
  final int min;
  final int max;
  final int step;
  final bool disableInput;
  final ValueChanged<int> onChange;
  final Color inputBoxColor, inputTextColor, actionButtonColor, actionIconColor;

  const MyStepper({
    Key key,
    this.defaultValue = 0,
    this.min = 0,
    this.max = 999,
    this.step = 1,
    this.disableInput = false,
    this.onChange,
    this.inputBoxColor,
    this.inputTextColor,
    this.actionButtonColor,
    this.actionIconColor,
  })  : assert(max >= min),
        assert(step >= 1),
        super(key: key);

  @override
  MyStepperState createState() => MyStepperState();
}

class MyStepperState extends State<MyStepper> {
  TextEditingController controller;

  num recordNumber = 0;
  bool enableMin;
  bool enableMax;

  @override
  void initState() {
    super.initState();
    recordNumber =
        math.min(widget.max, math.max(widget.defaultValue, widget.min));
    controller = TextEditingController(text: '$recordNumber');
    controller.addListener(valueChange);

    valueChange();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    children.add(Container(
      height: _KDefaultButtonSize,
      width: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        onPressed: enableMin ? onRemove : null,
        child: Icon(
          Icons.remove,
          color: AppColors.red,
        ),
      ),
    ));

    children.add(const SizedBox(width: _KDefaultSpace));

    children.add(Container(
      height: _KDefaultButtonSize,
      width: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.red, width: 1),
        color: widget?.inputBoxColor ??
            DividerTheme.of(context).color ??
            Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        enabled: !widget.disableInput,
        style: TextStyle(
            fontSize: _KDefaultTextFontSize, color: widget?.inputTextColor),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[-0-9]")),
          LengthLimitingTextInputFormatter(3),
        ],
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 0),
        ),
        onEditingComplete: inputComplete,
      ),
    ));

    children.add(const SizedBox(width: _KDefaultSpace));
    children.add(Container(
      height: _KDefaultButtonSize,
      width: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        onPressed: enableMax ? onAdd : null,
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
    ));

    return Row(
      children: children,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  void unFocus() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  void onRemove() {
    unFocus();
    int number = getNumber();
    number = math.max(
      widget.min,
      number - widget.step,
    );
    if (number != recordNumber) {
      updateControllerValue(number);
    }
  }

  void onAdd() {
    unFocus();
    int number = getNumber();
    number = math.min(
      widget.max,
      number + widget.step,
    );
    if (number != recordNumber) {
      updateControllerValue(number);
    }
  }

  int getNumber() {
    final String temp = controller.text;
    if (temp == null || temp.isEmpty) {
      return widget.min;
    } else {
      return math.min(widget.max, num.parse(temp));
    }
  }

  void updateControllerValue(num number) {
    controller.text = '$number';
    recordNumber = number;
    setState(() {});
  }

  void valueChange() {
    final num number = getNumber();
    enableMin = number != widget.min;
    enableMax = number != widget.max;
    if (number != recordNumber) {
      if (enableMax || enableMin) {
        recordNumber = number;
        setState(() {});
        callBackNumber();
      }
    }
  }

  void inputComplete() {
    unFocus();
    final int temp = getNumber();
    controller.text = '$temp';
    recordNumber = temp;
  }

  void callBackNumber() {
    if (widget.onChange != null) {
      final int temp = getNumber();
      widget.onChange(temp);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
