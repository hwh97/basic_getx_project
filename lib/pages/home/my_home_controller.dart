import 'package:basic_getx_project/commons/app_routes.dart';
import 'package:basic_getx_project/entity/yan_entity.dart';
import 'package:basic_getx_project/exceptions/repository_exception.dart';
import 'package:basic_getx_project/repositories/api_repository.dart';
import 'package:basic_getx_project/services/key_storage/key_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MyHomeController extends GetxController {
  final apiRepository = Get.find<ApiRepository>();
  final keyStorageService = Get.find<KeyStorageService>();
  Rx<YanEntity?> yan = Rx(null);

  @override
  void onInit() {
    super.onInit();
    refreshYan();
  }

  void refreshYan() async {
    try {
      yan.call(await apiRepository.fetchYan());
    } on RepositoryException catch (e) {
      Fluttertoast.showToast(msg: "Get data failed ${e.message}");
    }
  }

  void goNewRoute() {
    Get.toNamed(AppRoutes.testRoute);
  }

  void toggleLocale() {
    if (Get.locale?.languageCode == "en") {
      Get.updateLocale(const Locale("zh"));
      keyStorageService.saveSettingLanguage(1);
    } else {
      Get.updateLocale(const Locale("en"));
      keyStorageService.saveSettingLanguage(0);
    }
  }

  void toggleDarkMode() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      keyStorageService.saveSettingTheme(ThemeMode.light.index);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      keyStorageService.saveSettingTheme(ThemeMode.dark.index);
    }
  }
}