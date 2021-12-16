import 'package:flutter/material.dart';

class TestRoute extends StatelessWidget {
  const TestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page2"),
      ),
    );
  }
}
