import 'package:basic_getx_project/common/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }

  void goNewRoute() {
    Get.toNamed(AppRoutes.testRoute);
  }

  void toggleLocale() {
    if (Get.locale?.languageCode == "en") {
      Get.updateLocale(const Locale("zh"));
    } else {
      Get.updateLocale(const Locale("en"));
    }
  }

  void toggleDarkMode() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }
}