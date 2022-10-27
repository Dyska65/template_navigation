import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/widget_counter.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  final _addController = Get.find<FirstAddController>();
  final _subtractController = Get.find<FirstSubtractController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetCounter(
          controller: _addController,
          controllerSubtract: _subtractController,
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('FirstPage using two controllers'),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            ModalRoute.of(context)!.settings.arguments.toString(),
          ), // arguments dont work after hot restart
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/initial',
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Back to main screen'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/second_page',
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Second Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/third_page',
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Third Page'),
            ),
          ],
        )
      ],
    );
  }
}

class FirstAddController extends GetxController {
  RxInt value = 0.obs;

  void add() {
    value.value++;
  }
}

class FirstSubtractController extends GetxController {
  RxInt value = Get.find<FirstAddController>().value;

  void subtract() {
    value.value--;
  }
}
