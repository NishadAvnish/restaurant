import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:restaurant/app/atoms/helper_ui.dart';
import 'package:restaurant/app/core/constants.dart';
import 'package:restaurant/app/core/product_json.dart';
import 'package:restaurant/app/database/boxes.dart';
import 'package:restaurant/app/models/hive_model.dart';
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
    fetchCategory();
  }

  @override
  void onClose() {
    Hive.box("popular").close();
    super.onClose();
  }

  Future<void> fetchCategory() async {
    price = 0;
    addedItem.clear();

    await Future.delayed(const Duration(seconds: 1));
    productsModel = ProductsModel.fromJson(json);
    getPopularitemList();
  }

  void getPopularitemList() {
    final box = Boxes.getTransaction();
    List<HiveDataModel> allSavedData = box.values.toList();
    List<Category> popularItems = [];
    for (var element in allSavedData) {
      Category item = Category(id: element.id, selectedQuantity: 0.obs)
        ..instock = element.instock
        ..name = element.name
        ..price = element.price
        ..bestSeller = element.bestSeller ?? false;
      popularItems.add(item);
    }
    productsModel?.popular = popularItems;
    update();
  }

  void updateCartAddedItem(Category item, int quantity) {
    int index = addedItem.indexWhere((element) => element.id == item.id);

    price += quantity * (item.price ?? 1);

    if (index == -1) {
      item.update(quantity);
      addedItem.add(item);
    } else {
      price -= addedItem[index].selectedQuantity * addedItem[index].price!;
      Category _tempProduct = addedItem[index];
      _tempProduct.update(quantity);
      addedItem[index] = _tempProduct;
    }
    update(["PRICE"]);
  }

  void removeCartAddedItem(String productId) {
    int index = addedItem.indexWhere((element) => element.id == productId);
    price -= addedItem[index].selectedQuantity * (addedItem[index].price ?? 1);
    addedItem.removeAt(index);
    update(["PRICE"]);
  }

  Future<void> placeOrder(BuildContext context) async {
    showLoadingDialog();
    for (var element in addedItem) {
      await addPopularItems(element);
    }
    setBestSeller();

    // clear popular
    for (var ele in productsModel!.popular!) {
      for (var addedItem in addedItem) {
        if (addedItem.id == ele.id) {
          ele.update(0);
        }
      }
    }

    //clear salad
    for (var ele in productsModel!.salads!) {
      for (var addedItem in addedItem) {
        if (addedItem.id == ele.id) {
          ele.update(0);
        }
      }
    }
    //clear soup
    for (var ele in productsModel!.soup!) {
      for (var addedItem in addedItem) {
        if (addedItem.id == ele.id) {
          ele.update(0);
        }
      }
    }
    //clear chicken
    for (var ele in productsModel!.chicken!) {
      for (var addedItem in addedItem) {
        if (addedItem.id == ele.id) {
          ele.update(0);
        }
      }
    }
    //fruits
    for (var ele in productsModel!.fruits!) {
      for (var addedItem in addedItem) {
        if (addedItem.id == ele.id) {
          ele.update(0);
        }
      }
    }
    hideLoadingDialog();
    showToast(context, "Your Order of $CURRENCY $price has been created");
    price = 0;
    addedItem.clear();
    update(["PRICE"]);
  }

  Future<void> addPopularItems(Category dataModel) async {
    final box = Boxes.getTransaction();
    final hiveDataModel = HiveDataModel()
      ..id = dataModel.id
      ..instock = dataModel.instock!
      ..name = dataModel.name!
      ..price = dataModel.price!
      ..count = dataModel.selectedQuantity.value;

    List<HiveDataModel> productList = box.values.toList();
    productList.sort((a, b) => a.count.compareTo(b.count));
    HiveDataModel? savedProduct = box.get(hiveDataModel.id);

    if (savedProduct != null) {
      hiveDataModel.count += savedProduct.count;
      box.delete(dataModel.id);
      box.put(dataModel.id, hiveDataModel);
    } else {
      if (box.keys.length >= 3) {
        box.delete(productList[0].id);
      }
      box.put(hiveDataModel.id, hiveDataModel);
    }
  }

  void setBestSeller() {
    final box = Boxes.getTransaction();
    String? maxId;
    int maxCount = 0;
    List<HiveDataModel> productList = box.values.toList();
    for (HiveDataModel item in productList) {
      if (item.count > maxCount) {
        maxId = item.id;
        maxCount = item.count;
      }
      box.put(item.id, item..bestSeller = false);
    }

    HiveDataModel? product = box.get(maxId!);

    if (product != null) {
      product.bestSeller = true;
      box.put(product.id, product);
    }
  }
}
