import 'package:basic_getx_project/services/key_storage/key_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeMode get themeMode {
    int? code = Get.find<KeyStorageService>().settingTheme;
    if (code != null) {
      return ThemeMode.values[code];
    }
    return ThemeMode.system;
  }

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