import 'package:flutter/material.dart';
import 'package:restaurant/app/core/app_color.dart';
import 'package:get/get.dart';

class HelperUI {
  static Widget getProgressIndicator([Color? color = AppColors.COLOR_WHITE]) {
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
}
