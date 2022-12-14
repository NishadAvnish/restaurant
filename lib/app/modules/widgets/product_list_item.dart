import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:restaurant/app/core/app_color.dart';
import 'package:restaurant/app/core/constants.dart';
import 'package:restaurant/app/atoms/custom_card.dart';
import 'package:restaurant/app/core/spacers.dart';
import 'package:restaurant/app/atoms/text_extension.dart';
import 'package:restaurant/app/models/products_model.dart';
import 'package:restaurant/app/modules/productlisting/controllers/productlisting_controller.dart';
import 'package:restaurant/app/molecules/quantity_action_button.dart';

class ProductListItem extends GetView<ProductlistingController> {
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
                    Row(
                      children: [
                        (product.name ?? "").body16(
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.COLOR_BLACK),
                        if (product.bestSeller!) ...[
                          CustomSpacers.width10,
                          Container(
                            padding: EdgeInsets.all(3.h),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.COLOR_BLUE_500),
                                borderRadius: BorderRadius.circular(
                                    VALUE_INPUT_BORDER_RADIUS)),
                            child: "BestSeller".body14(
                              textColor: AppColors.COLOR_BLUE_500,
                            ),
                          ),
                        ]
                      ],
                    ),
                    CustomSpacers.height4,
                    ("$CURRENCY ${product.price ?? 0}").body16(),
                  ],
                ),
              ),
              Obx(() {
                return QuantityEditor(
                    initialQuantity: product.selectedQuantity.value,
                    onUpdate: (int val) {
                      if (val == 0) {
                        controller.removeCartAddedItem(product.id);
                        return;
                      }

                      controller.updateCartAddedItem(product, val);
                    });
              })
            ],
          ),
        ));
  }
}
