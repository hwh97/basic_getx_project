import 'package:basic_getx_project/lang/lang_zh.dart';
import 'package:basic_getx_project/lang/lang_en.dart';
import 'package:basic_getx_project/services/key_storage/key_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  static Locale? get locale {
    int? code = Get.find<KeyStorageService>().settingLanguage;
    if (code != null) {
      return code == 1 ? const Locale('zh', 'CN') : const Locale("en", "US");
    }
    return Get.deviceLocale;
  }
  static Locale get fallbackLocale => const Locale('zh', 'CN');

  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': zhCN,
    'en_US': enUS,
  };
}