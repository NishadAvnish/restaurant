import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/app/atoms/expandable_widget.dart';
import 'package:restaurant/app/atoms/helper_ui.dart';
import 'package:restaurant/app/modules/widgets/product_category_view.dart';
import 'package:restaurant/app/molecules/product_list_item.dart';
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
        body: controller.productsModel == null
            ? getProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.productsModel?.popular != null)
                    CategoryView(title: "Salads", items: controller.productsModel!.popular!)
                  ],
                ),
              ));
  }
}
