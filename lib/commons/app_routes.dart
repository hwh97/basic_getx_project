import 'package:basic_getx_project/repositories/api_repository.dart';
import 'package:basic_getx_project/repositories/api_repository_impl.dart';
import 'package:basic_getx_project/pages/home/my_home.dart';
import 'package:basic_getx_project/pages/home/my_home_controller.dart';
import 'package:basic_getx_project/pages/test_route/test_route.dart';
import 'package:basic_getx_project/pages/test_route/test_route_controller.dart';
import 'package:basic_getx_project/pages/unknown_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = "/home";
  static const unknownRoute = "/404";
  static const testRoute = "/testRoute";

  static final unknownPage =
      GetPage(name: unknownRoute, page: () => const UnknownPage());
  static final pages = [
    GetPage(
        name: initialRoute,
        page: () => const MyHomePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ApiRepository>(() => ApiRepositoryImpl(Get.find()));
          Get.lazyPut(() => MyHomeController());
        })),
    GetPage(
        name: testRoute,
        page: () => const TestRoute(),
        binding: BindingsBuilder(() {
          Get.put(TestRouteController());
        })),
  ];
}
