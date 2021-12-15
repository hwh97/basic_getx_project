import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("page not found"),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Back To Previous Page"),
            ),
          ],
        ),
      ),
    );
  }
}
