import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/app/core/app_color.dart';
import 'package:restaurant/app/core/constants.dart';
import 'package:restaurant/app/atoms/text_extension.dart';

class QuantityEditor extends StatelessWidget {
  final Function(int value) onUpdate;
  final int initialQuantity;
  QuantityEditor(
      {Key? key, required this.onUpdate, required this.initialQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> quantity = ValueNotifier(initialQuantity);

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
                      onUpdate(1);
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
                              onUpdate(quantity.value);
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
                            onUpdate(quantity.value);
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
