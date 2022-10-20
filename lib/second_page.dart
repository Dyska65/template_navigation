import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/widget_counter.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);
  final _secondController = Get.find<SecondController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetCounter(controller: _secondController),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('SecondPage'),
        ),
        const Text('Using Permanent Second controller'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Get.offAllNamed('/initial');
              },
              child: const Text('Back to main screen'),
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed('/first_page');
              },
              child: const Text('First Page'),
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed('/third_page');
              },
              child: const Text('Third Page'),
            ),
          ],
        )
      ],
    );
  }
}

class SecondController extends GetxController {
  RxInt value = 0.obs;

  void add() => value.value++;

  void subtract() => value.value--;
}
