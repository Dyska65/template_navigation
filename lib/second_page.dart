import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/widget_counter.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _secondController = Get.put<SecondController>(SecondController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetCounter(controllerAdd: _secondController),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('SecondPage'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Get.offAllNamed('/');
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
