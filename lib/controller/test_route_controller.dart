import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TestRouteController extends GetxController {
  @override
  void onClose() {
    if (kDebugMode) {
      print("test onclose");
    }
    super.onClose();
  }
}