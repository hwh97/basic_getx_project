import 'package:basic_getx_project/controller/count_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CountController>();

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
            Obx(() {
              return Text(
                '${controller.count}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: () => controller.goNewRoute(), child: const Text("New Route")),
                TextButton(onPressed: () => controller.toggleDarkMode(), child: const Text("toggle dark mode")),
                TextButton(onPressed: () => controller.toggleLocale(), child: const Text("toggle language")),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}