import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/app/core/app_color.dart';

class PersistanceNavButton extends StatelessWidget {
  final Widget? widget;

  const PersistanceNavButton({Key? key, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget != null)
          Container(
            height: 92.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            color: AppColors.COLOR_WHITE,
            child: Center(
              child: widget,
            ),
          ),
      ],
    );
  }
}
