import 'package:flutter/material.dart';
import 'package:grocery/src/styles/colors.dart';
import 'package:grocery/src/styles/text.dart';
import 'package:grocery/src/widgets/myStepeer.dart';

class MyItemListCard extends StatelessWidget {
  const MyItemListCard(
      {Key key,
      @required this.title,
      @required this.quantity,
      @required this.moneySpent,
      @required this.imageUrl})
      : super(key: key);
  final String title;
  final String quantity;
  final String moneySpent;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 8.0,
      shadowColor: AppColors.textField,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        height: 70,
        child: Row(
          children: [
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.userIdBold,
                    ),
                    Text(
                      'Qty: $quantity   |   Price: $moneySpent',
                      style: AppTextStyles.suggestion,
                    )
                  ],
                )),
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.2,
              child: MyStepper(inputBoxColor: Colors.transparent,inputTextColor: AppColors.black,),
            ),
          ],
        ),
      ),
    );
  }
}
