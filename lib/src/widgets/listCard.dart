import 'package:flutter/material.dart';
import 'package:grocery/src/styles/colors.dart';
import 'package:grocery/src/styles/text.dart';
import 'package:velocity_x/velocity_x.dart';

class MyMenuCard extends StatelessWidget {
  const MyMenuCard(
      {Key key,
      @required this.title,
      @required this.quantity,
      @required this.moneySpent,
      @required this.onTap})
      : super(key: key);
  final String title;
  final String quantity;
  final String moneySpent;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 20),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(50, 0.0, 20, 0.0),
              child: Card(
                color: AppColors.white,
                elevation: 8.0,
                shadowColor: AppColors.textField,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  height: 70,
                  width: 275,
                  padding: EdgeInsets.fromLTRB(40, 0.0, 0.0, 0),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.userIdBold.copyWith(fontSize: 22),
                  ),
                  Text(
                    'Money Spent: \$ $moneySpent',
                    style: AppTextStyles.timeAgoExtraLight.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Item Qty: $quantity',
                    style: AppTextStyles.timeAgoExtraLight.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  VxCircle(
                    radius: 30,
                    backgroundColor: AppColors.white,
                    shadows: [
                      BoxShadow(
                        color: AppColors.textGrey,
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ],
                    child: Icon(
                      Icons.add,
                      size: 15,
                      color: AppColors.greeen,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
