import 'package:flutter/material.dart';
import 'package:grocery/src/styles/colors.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: AppColors.lightblue,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: AppColors.white,
          ),
          Icon(
            Icons.notifications_active_rounded,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}
