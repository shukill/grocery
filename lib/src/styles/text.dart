import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

abstract class AppTextStyles {

   static TextStyle get buttonTextLight {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(color: AppColors.white, fontWeight: FontWeight.bold));
  }

  static TextStyle get userNameLight{
    return TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w300
    );
  }
    static TextStyle get userIdBold{
    return TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w700
    );
  }
    static TextStyle get timeAgoExtraLight{
    return TextStyle(
      fontSize: 12,
      color: AppColors.textGrey,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w200
    );
  }

  static TextStyle get subtitle {
    return GoogleFonts.rosario(
      textStyle: TextStyle(
        color: AppColors.suggestionText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    );
  }

  static TextStyle get title {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(color: AppColors.white, fontWeight: FontWeight.bold));
  }

  static TextStyle get navTitleMaterial {
    return GoogleFonts.poppins(
        textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
  }

  static TextStyle get body {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: AppColors.darkgray,
        fontSize: 16.0,
      ),
    );
  }

  static TextStyle get bodyLightBlue {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.lightblue, fontSize: 16.0));
  }

  static TextStyle get bodyRed {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.red, fontSize: 16.0));
  }

  static TextStyle get picker {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.darkgray, fontSize: 35.0));
  }


  static TextStyle get suggestion {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: AppColors.darkgray,
        fontSize: 14.0,
      ),
    );
  }

  static TextStyle get error {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.red, fontSize: 12.0));
  }


}
