import 'package:restaurant/app/molecules/quantity_action_button.dart';
import 'package:uuid/uuid.dart';

class ProductsModel {
  List<Category>? popular = [];
  List<Category>? salads = [];
  List<Category>? chicken = [];
  List<Category>? soup = [];
  List<Category>? fruits = [];

  ProductsModel(
      {this.popular, this.salads, this.chicken, this.soup, this.fruits});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['cat1'] != null) {
      salads = <Category>[];
      json['cat1'].forEach((v) {
        salads!.add(Category.fromJson(v));
      });
    }
    if (json['cat2'] != null) {
      chicken = <Category>[];
      json['cat2'].forEach((v) {
        chicken!.add(Category.fromJson(v));
      });
    }
    if (json['cat3'] != null) {
      soup = <Category>[];
      json['cat3'].forEach((v) {
        soup!.add(Category.fromJson(v));
      });
    }
    if (json['cat4'] != null) {
      fruits = <Category>[];
      json['cat4'].forEach((v) {
        fruits!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (popular != null) {
      data['popular'] = popular!.map((v) => v.toJson()).toList();
    }
    if (salads != null) {
      data['salads'] = salads!.map((v) => v.toJson()).toList();
    }
    if (chicken != null) {
      data['chicken'] = chicken!.map((v) => v.toJson()).toList();
    }
    if (soup != null) {
      data['soup'] = soup!.map((v) => v.toJson()).toList();
    }
    if (fruits != null) {
      data['fruits'] = fruits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? name;
  int? price;
  late String id;
  bool? instock;
  int selectedQuantity = 0;
  void update(quantity) {
    selectedQuantity = quantity;
  }

  Category(
      {this.name,
      this.price,
      this.instock,
      this.selectedQuantity = 0,
      required this.id});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
    id = const Uuid().v1();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['instock'] = instock;
    return data;
  }
}
