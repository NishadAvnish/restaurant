import 'package:get/get.dart';

import '../controllers/productlisting_controller.dart';

class ProductlistingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductlistingController>(
      () => ProductlistingController(),
    );
  }
}
