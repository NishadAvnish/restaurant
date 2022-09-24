import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveDataModel extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int price;
  @HiveField(2)
  late String id;
  @HiveField(3)
  late bool instock;
}
