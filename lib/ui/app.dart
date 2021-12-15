import 'dart:ui' as ui;
import 'package:basic_getx_project/common/app_routes.dart';
import 'package:basic_getx_project/common/app_themes.dart';
import 'package:basic_getx_project/common/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme(),
      darkTheme: AppThemes.darkTheme(),
      translations: AppTranslations(),
      locale: ui.window.locale,
      fallbackLocale: const Locale('zh', 'CN'),
      unknownRoute: AppRoutes.unknownPage,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
