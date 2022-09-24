import 'package:get/get.dart';
import 'package:restaurant/app/atoms/helper_ui.dart';
import 'package:restaurant/app/core/product_json.dart';
import 'package:restaurant/app/models/products_model.dart';

class ProductlistingController extends GetxController with HelperUI {
  ProductsModel? productsModel;
  List<Category> addedItem = <Category>[].obs;
  double price = 0;
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
    await Future.delayed(const Duration(seconds: 1));
    productsModel = ProductsModel.fromJson(json);
    update();
  }

  void updateAddedItem(Category item, int quantity) {
    int index = addedItem.indexWhere((element) => element.id == item.id);

    price += quantity * (item.price ?? 1);

    if (index == -1) {
      item.update(quantity);
      addedItem.add(item);
    } else {
      price -= addedItem[index].selectedQuantity * addedItem[index].price!;
      addedItem[index].update(quantity);
    }
    print(price);

    update(["PRICE"]);
  }

  void removeItem(String productId) {
    int index = addedItem.indexWhere((element) => element.id == productId);
    price -= addedItem[index].selectedQuantity * (addedItem[index].price ?? 1);
    addedItem.removeAt(index);
    update(["PRICE"]);
  }
}
