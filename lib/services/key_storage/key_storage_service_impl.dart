import 'package:basic_getx_project/services/key_storage/key_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyStorageServiceImpl extends KeyStorageService {
  static const keySettingLanguage = "setting_language";
  static const keySettingTheme = "setting_theme";

  static late SharedPreferences _preferences;

  /// must call in the first time
  Future<KeyStorageServiceImpl> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  @override
  int? get settingLanguage => _getFromSp(keySettingLanguage);

  @override
  Future<bool> saveSettingLanguage(int? value) {
    return _saveToSp(keySettingLanguage, value);
  }

  @override
  int? get settingTheme => _getFromSp(keySettingTheme);

  @override
  Future<bool> saveSettingTheme(int? value) {
    return _saveToSp(keySettingTheme, value);
  }

  dynamic _getFromSp(String key) {
    final value = _preferences.get(key);
    return value;
  }

  Future<bool> _saveToSp(String key, dynamic value) {
    if (value == null) {
      // remove key
      return _preferences.remove(key);
    }

    if (value is String) {
      return _preferences.setString(key, value);
    }
    if (value is bool) {
      return _preferences.setBool(key, value);
    }
    if (value is int) {
      return _preferences.setInt(key, value);
    }
    if (value is double) {
      return _preferences.setDouble(key, value);
    }
    if (value is List<String>) {
      return _preferences.setStringList(key, value);
    }
    return Future.value(false);
  }
}
