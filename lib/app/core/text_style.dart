import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/app/core/app_color.dart';

class MontserratStyle {
  MontserratStyle._();

  static const strFontFamily = "Montserrat";

  static TextStyle h3SemiboldGrey900_25px = TextStyle(
      fontSize: 25.sp,
      color: AppColors.COLOR_GREY_900,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
}

class Style_OpenSans {
  static const strFontFamily = "OpenSansRegular";
  static TextStyle bodyRegularGrey400_16px = TextStyle(
      fontSize: 16.sp,
      color: AppColors.COLOR_GREY_400,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);

  static TextStyle bodyRegularGrey400_14px = TextStyle(
      fontSize: 14.sp,
      color: AppColors.COLOR_GREY_400,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: strFontFamily,
      letterSpacing: 0.2);
}
