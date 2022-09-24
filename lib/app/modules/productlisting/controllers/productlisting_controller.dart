import 'package:get/get.dart';
import 'package:restaurant/app/core/helper_ui.dart';
import 'package:restaurant/app/core/product_json.dart';
import 'package:restaurant/app/models/products_model.dart';

class ProductlistingController extends GetxController with HelperUI {
  ProductsModel? productsModel;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _fetchCategory();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _fetchCategory() async {
    showLoadingDialog();
    await Future.delayed(const Duration(seconds: 1));
    productsModel = ProductsModel.fromJson(json);
    hideLoadingDialog();
  }
}
