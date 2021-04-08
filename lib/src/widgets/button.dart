import 'package:flutter/material.dart';
import 'package:grocery/src/styles/base.dart';
import 'package:grocery/src/styles/buttons.dart';
import 'package:grocery/src/styles/colors.dart';
import 'package:grocery/src/styles/text.dart';

class AppButton extends StatefulWidget {
  final String buttonText;
  final ButtonType buttonType;
  final void Function() onPressed;

  AppButton({@required this.buttonText, this.buttonType, this.onPressed});

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    TextStyle fontStyle;
    Color buttonColor;
    Color borderColor = Colors.transparent;

    switch (widget.buttonType) {
      case ButtonType.Red:
        fontStyle = AppTextStyles.buttonTextLight;
        buttonColor = AppColors.red;
        break;

      default:
        fontStyle = AppTextStyles.buttonTextLight;
        buttonColor = AppColors.red;
        break;
    }

    return AnimatedContainer(
      padding: EdgeInsets.only(
          top: (pressed)
              ? BaseStyles.listFieldVertical + BaseStyles.animationOffset
              : BaseStyles.listFieldVertical,
          bottom: (pressed)
              ? BaseStyles.listFieldVertical - BaseStyles.animationOffset
              : BaseStyles.listFieldVertical,
          left: BaseStyles.listFieldHorizontal,
          right: BaseStyles.listFieldHorizontal),
      child: GestureDetector(
        child: Container(
          height: ButtonStyles.buttonHeight,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              color: buttonColor,
              borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
              boxShadow:
                  pressed ? BaseStyles.boxShadowPressed : BaseStyles.boxShadow),
          child: Center(
            child: Text(
              widget.buttonText,
              style: fontStyle,
            ),
          ),
        ),
        onTapDown: (details) {
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        onTapUp: (details) {
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        onTap: () {
          if (widget.buttonType != ButtonType.Disabled) {
            widget.onPressed();
          }
        },
      ),
      duration: Duration(milliseconds: 20),
    );
  }
}

enum ButtonType {
  LightBlue,
  Red,
  Disabled,
  DarkGray,
  DarkBlue,
  Orange,
  Outline
}
