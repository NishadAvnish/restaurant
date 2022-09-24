import 'package:flutter/material.dart';
import 'package:restaurant/app/atoms/text_extension.dart';
import 'package:restaurant/app/core/app_color.dart';
import 'package:get/get.dart';

mixin HelperUI {
  Widget getProgressIndicator([Color? color = AppColors.COLOR_BLUE_500]) {
    return Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          color: color!,
        ),
      ),
    );
  }

  showLoadingDialog([bool? barrierDismissible = true]) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      barrierDismissible: barrierDismissible!,
    );
  }

  hideLoadingDialog() {
    Get.back();
  }

  showToast(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: message.body14(
          textColor: AppColors.COLOR_WHITE, textAlign: TextAlign.start),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
