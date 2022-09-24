import 'package:get/get.dart';

import '../modules/productlisting/bindings/productlisting_binding.dart';
import '../modules/productlisting/views/productlisting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRODUCTLISTING;

  static final routes = [
    GetPage(
      name: _Paths.PRODUCTLISTING,
      page: () => const ProductlistingView(),
      binding: ProductlistingBinding(),
    ),
  ];
}
