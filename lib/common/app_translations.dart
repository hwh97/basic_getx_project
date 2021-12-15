import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {
      'hello': '你好 %s ',
    },
    'en_US': {
      'hello': 'hello %s',
    }
  };
}