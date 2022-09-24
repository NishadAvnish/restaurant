import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/app/atoms/expandable_widget.dart';
import 'package:restaurant/app/models/products_model.dart';
import 'package:restaurant/app/modules/widgets/product_list_item.dart';

class CategoryView extends StatelessWidget {
  final String title;
  final List<Category> items;
  const CategoryView({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandibleWidget(
      isExpanded: false,
      headingTitle: title,
      expandedAreaWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((e) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: ProductListItem(product: e),
                ))
            .toList(),
      ),
    );
  }
}
