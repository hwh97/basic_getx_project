import 'dart:io';

import 'package:basic_getx_project/services/api/api_service.dart';
import 'package:basic_getx_project/services/api/api_service_impl.dart';
import 'package:basic_getx_project/services/key_storage/key_storage_service.dart';
import 'package:basic_getx_project/services/key_storage/key_storage_service_impl.dart';
import 'package:basic_getx_project/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  await initService();
  runApp(const MyApp());
}

Future initService() async {
  Get.put<ApiService>(ApiServiceImpl()..init(accessToken: "token"));
  await Get.putAsync<KeyStorageService>(() => KeyStorageServiceImpl().init());
}