import 'package:flutter/material.dart';
import 'app_color.dart';

class AppThemes {
  static final ligtTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.COLOR_BLUE_50,
      colorScheme:
          const ColorScheme.light().copyWith(primary: AppColors.COLOR_BLUE_500),
      fontFamily: 'OpenSansRegular',
      backgroundColor: AppColors.COLOR_BLUE_50,
      primaryColor: AppColors.COLOR_BLUE_900,
      canvasColor: Colors.transparent);
}
