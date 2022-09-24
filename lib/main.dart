import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant/app/modules/app_launch.dart';

import 'app/models/hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveDataModelAdapter());
  await Hive.openBox<HiveDataModel>("popular");
  runApp(
    const AppLaunch(),
  );
}
