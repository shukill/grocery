import 'package:flutter/material.dart';
import 'package:grocery/src/styles/colors.dart';



class BuildSearchBar extends StatelessWidget {
  const BuildSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search food",
        hintStyle: TextStyle(color: Colors.grey.shade400),
        suffixIcon: Icon(
          Icons.search,
          size: 20,
          color: Colors.grey.shade400,
        ),
        contentPadding: EdgeInsets.all(8),
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}