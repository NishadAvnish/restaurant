import 'package:hive/hive.dart';
import 'package:restaurant/app/models/hive_model.dart';

class Boxes {
  static Box<HiveDataModel> getTransaction() => Hive.box("popular");
}
