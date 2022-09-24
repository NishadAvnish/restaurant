import 'package:flutter/material.dart';
import 'package:restaurant/app/core/text_style.dart';

extension ExtendedString on String {
  Text h25(
          {Color? textColor,
          TextAlign? textAlign = TextAlign.center,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextOverflow? overflow}) =>
      Text(
        this,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: textColor == null
            ? MontserratStyle.h3SemiboldGrey900_25px
            : MontserratStyle.h3SemiboldGrey900_25px.copyWith(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      );

  Text body16(
          {Color? textColor,
          FontWeight? fontWeight,
          double? fontSize,
          TextAlign? textAlign = TextAlign.center,
          int? maxLines,
          double? height,
          TextOverflow? overflow}) =>
      Text(this,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign,
          style: textColor == null
              ? Style_OpenSans.bodyRegularGrey400_16px
              : Style_OpenSans.bodyRegularGrey400_16px.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  height: height,
                  fontWeight: fontWeight));
  Text body14(
          {Color? textColor,
          FontWeight? fontWeight,
          double? fontSize,
          TextAlign? textAlign = TextAlign.center,
          int? maxLines,
          double? height,
          TextOverflow? overflow}) =>
      Text(this,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign,
          style: textColor == null
              ? Style_OpenSans.bodyRegularGrey400_14px
              : Style_OpenSans.bodyRegularGrey400_14px.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  height: height,
                  fontWeight: fontWeight));
}
