import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/productlisting_controller.dart';

class ProductlistingView extends GetView<ProductlistingController> {
  const ProductlistingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
          ],
        ),)
        );
  }
}
