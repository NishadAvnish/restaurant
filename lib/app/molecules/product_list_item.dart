import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/app/core/app_color.dart';
import 'package:restaurant/app/core/constants.dart';
import 'package:restaurant/app/atoms/custom_card.dart';
import 'package:restaurant/app/core/spacers.dart';
import 'package:restaurant/app/atoms/text_extension.dart';
import 'package:restaurant/app/models/products_model.dart';
import 'package:restaurant/app/molecules/quantity_action_button.dart';

class ProductListItem extends StatelessWidget {
  final Category product;
  const ProductListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: CustomCard(
          horizontalPadding: 16.w,
          verticalPadding: 12.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (product.name ?? "").body16(
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.COLOR_BLACK),
                    CustomSpacers.height4,
                    ("$CURRENCY ${product.price ?? 0}").body16(),
                  ],
                ),
              ),
              QuantityEditor(onAdd: (int val) {}, onSubstract: (int val) {})
            ],
          ),
        ));
  }
}
