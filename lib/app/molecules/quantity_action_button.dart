import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/app/core/app_color.dart';
import 'package:restaurant/app/core/constants.dart';
import 'package:restaurant/app/atoms/text_extension.dart';

class QuantityEditor extends StatelessWidget {
  final Function(int value) onAdd;
  final Function(int value) onSubstract;
  QuantityEditor({Key? key, required this.onAdd, required this.onSubstract})
      : super(key: key);

  ValueNotifier<int> quantity = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      constraints: BoxConstraints(minWidth: 70.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LARGE_BORDER_RADIUS),
          border: Border.all(
            color: AppColors.COLOR_BLUE_500,
          )),
      child: ValueListenableBuilder<int>(
          valueListenable: quantity,
          builder: (context, int quantityValue, _) {
            return quantityValue == 0
                ? GestureDetector(
                    onTap: () {
                      quantity.value = 1;
                    },
                    child: Center(
                        child:
                            "Add".body14(textColor: AppColors.COLOR_BLUE_500)),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (quantityValue >= 1) {
                              quantity.value -= 1;
                              onSubstract(quantityValue);
                            }
                          },
                          child: const Icon(
                            Icons.remove,
                            color: AppColors.COLOR_BLUE_500,
                          )),
                      Container(
                        height: 48.h,
                        width: 48.h,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.COLOR_BLUE_500,
                        ),
                        child: "$quantityValue".body14(
                          textColor: AppColors.COLOR_WHITE,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            quantity.value += 1;
                            onAdd(quantityValue);
                          },
                          child: const Icon(
                            Icons.add,
                            color: AppColors.COLOR_BLUE_500,
                          )),
                    ],
                  );
          }),
    );
  }
}
