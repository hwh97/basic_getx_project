import 'package:get/get.dart';

abstract class KeyStorageService extends GetxService {
  int? get settingLanguage;

  Future<bool> saveSettingLanguage(int? value);

  int? get settingTheme;

  Future<bool> saveSettingTheme(int? value);
}
