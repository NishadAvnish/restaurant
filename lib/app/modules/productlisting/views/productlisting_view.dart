import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app/atoms/helper_ui.dart';
import 'package:restaurant/app/atoms/text_extension.dart';
import 'package:restaurant/app/core/app_color.dart';
import 'package:restaurant/app/core/constants.dart';
import 'package:restaurant/app/core/spacers.dart';
import 'package:restaurant/app/modules/widgets/product_category_view.dart';
import 'package:restaurant/app/molecules/persistence_button.dart';
import '../controllers/productlisting_controller.dart';

class ProductlistingView extends GetView<ProductlistingController>
    with HelperUI {
  const ProductlistingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          centerTitle: true,
        ),
        bottomNavigationBar: GetBuilder(
            init: controller,
            id: "PRICE",
            builder: (_) {
              return PersistanceNavButton(
                widget: Container(
                  width: double.infinity,
                  height: 48.h,
                  decoration: BoxDecoration(
                      color: AppColors.COLOR_BLUE_500,
                      borderRadius:
                          BorderRadius.circular(VALUE_INPUT_BORDER_RADIUS)),
                  child: Row(
                    children: [
                      Expanded(
                        child: "Place Order".body16(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            textColor: AppColors.COLOR_WHITE),
                      ),
                      if (controller.price != 0)
                        ("$CURRENCY ${controller.price}")
                            .body16(textColor: AppColors.COLOR_WHITE),
                      CustomSpacers.width6
                    ],
                  ),
                ),
              );
            }),
        body: GetBuilder(
            init: controller,
            builder: (_) {
              return controller.productsModel == null
                  ? getProgressIndicator()
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.productsModel?.salads != null)
                            CategoryView(
                                title: "Salad",
                                items: controller.productsModel!.salads!),
                          if (controller.productsModel?.soup != null)
                            CategoryView(
                                title: "Soup",
                                items: controller.productsModel!.soup!),
                          if (controller.productsModel?.chicken != null)
                            CategoryView(
                                title: "Chicken",
                                items: controller.productsModel!.chicken!),
                          if (controller.productsModel?.fruits != null)
                            CategoryView(
                                title: "Fruits",
                                items: controller.productsModel!.fruits!)
                        ],
                      ),
                    );
            }));
  }
}
