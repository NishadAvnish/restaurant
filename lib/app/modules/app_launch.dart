import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant/app/core/theme.dart';
import 'package:restaurant/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLaunch extends StatelessWidget {
  const AppLaunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Restaurant",
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          enableLog: true,
          themeMode: ThemeMode.system,
          theme: AppThemes.ligtTheme,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
