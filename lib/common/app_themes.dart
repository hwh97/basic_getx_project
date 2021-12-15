import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData darkTheme() {
    IAppColors colors = appColors(dark: true);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColorBrightness: Brightness.dark,
      primarySwatch: colors.primarySwatch,
    );
  }

  static ThemeData lightTheme() {
    IAppColors colors = appColors(dark: false);
    return ThemeData(
      brightness: Brightness.light,
      primaryColorBrightness: Brightness.light,
      primarySwatch: colors.primarySwatch,
    );
  }

  static IAppColors appColors({required bool dark}) {
    return dark ? DarkAppColors() : LightAppColors();
  }
}