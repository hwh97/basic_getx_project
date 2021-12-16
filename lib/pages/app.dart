import 'package:basic_getx_project/commons/app_routes.dart';
import 'package:basic_getx_project/commons/app_themes.dart';
import 'package:basic_getx_project/commons/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: AppThemes.themeMode,
      theme: AppThemes.lightTheme(),
      darkTheme: AppThemes.darkTheme(),
      translations: AppTranslations(),
      locale: AppTranslations.locale,
      fallbackLocale: AppTranslations.fallbackLocale,
      unknownRoute: AppRoutes.unknownPage,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
