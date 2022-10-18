import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/widget_counter.dart';

class MainPage extends GetView<MainController> {
  MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final _mainController = Get.find<MainController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to first module'),
        leading: const SizedBox.shrink(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text(
                    'Check error "Unknown Route"',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () => Get.offAllNamed('____'),
                ),
                TextButton(
                  child: const Text('Go to Screens'),
                  onPressed: () => Get.offAllNamed('/first_page'),
                ),
              ],
            ),
            WidgetCounter(
              controllerAdd: _mainController,
            )
          ],
        ),
      ),
    );
  }
}

class MainController extends GetxController {
  RxInt value = 0.obs;

  void add() => value.value++;

  void subtract() => value.value--;
}
