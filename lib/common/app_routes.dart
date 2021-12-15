import 'package:basic_getx_project/controller/count_controller.dart';
import 'package:basic_getx_project/controller/test_route_controller.dart';
import 'package:basic_getx_project/ui/page/my_home.dart';
import 'package:basic_getx_project/ui/page/test_route.dart';
import 'package:basic_getx_project/ui/page/unknown_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = "/home";
  static const unknownRoute = "/404";
  static const testRoute = "/testRoute";

  static final pages = [
    GetPage(name: initialRoute, page: () => const MyHomePage(), binding: BindingsBuilder(() {
      Get.put(CountController());
    })),
    GetPage(name: testRoute, page: () => const TestRoute(), binding: BindingsBuilder(() {
      Get.put(TestRouteController());
    })),
  ];

  static final unknownPage = GetPage(name: unknownRoute, page: () => const UnknownPage());
}
