import 'package:basic_getx_project/pages/home/my_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyHomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'hello'.trArgs(["world"]),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: () => controller.goNewRoute(), child: const Text("New Route")),
                TextButton(onPressed: () => controller.toggleDarkMode(), child: const Text("toggle dark mode")),
                TextButton(onPressed: () => controller.toggleLocale(), child: const Text("toggle language")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return Text(
                  controller.yan.value == null ? "Loading" : controller.yan.value!.text,
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.refreshYan,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}