import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/app/core/app_color.dart';
import 'package:restaurant/app/core/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool? showShadow;
  final double? elevation;
  final Color? borderColor, bgColor;

  const CustomCard(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.showShadow = true,
      this.horizontalPadding,
      this.elevation,
      this.borderColor,
      this.bgColor = AppColors.COLOR_WHITE,
      this.verticalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      shape: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(borderRadius ?? VALUE_INPUT_BORDER_RADIUS),
        borderSide: BorderSide(
          color: (borderColor == null ? AppColors.COLOR_WHITE : borderColor!),
        ),
      ),
      elevation: elevation ?? 0.0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16.w,
          vertical: verticalPadding ?? 16.h,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor ?? AppColors.COLOR_WHITE),
          borderRadius: BorderRadius.circular(
            borderRadius ?? VALUE_INPUT_BORDER_RADIUS,
          ),
          boxShadow: showShadow!
              ? [
                  BOXSHADOW(
                    bRadius: 1,
                  ),
                ]
              : [],
        ),
        child: child,
      ),
    );
  }
}
