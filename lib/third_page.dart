import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/widget_counter.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _thirdController = Get.put<ThirdController>(ThirdController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetCounter(controllerAdd: _thirdController),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('ThirdPage'),
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
                Get.offAllNamed('/second_page');
              },
              child: const Text('Second Page'),
            ),
          ],
        )
      ],
    );
  }
}

class ThirdController extends GetxController {
  RxInt value = 0.obs;

  void add() => value.value++;

  void subtract() => value.value--;
}
