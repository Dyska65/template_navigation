import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/second_page.dart';
import 'package:template_navigation/widget_counter.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({Key? key}) : super(key: key);
  final _thirdController = Get.find<SecondController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetCounter(controller: _thirdController),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('ThirdPage'),
        ),
        const Text('This screen using SecondController'),
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
