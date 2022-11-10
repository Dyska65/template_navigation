import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/widget_counter.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with RestorationMixin {
  final _addController = Get.find<FirstAddController>();

  final _subtractController = Get.find<FirstSubtractController>();

  RestorableInt _counterRestorable2 = RestorableInt(0);

  @override
  Widget build(BuildContext context) {
    print('_FirstPageState');
    print(_counterRestorable2.value++);
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
                Get.toNamed(
                  '/initial',
                );
              },
              child: const Text('Back to main screen'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(
                  '/second_page',
                );
              },
              child: const Text('Second Page'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(
                  '/third_page',
                );
              },
              child: const Text('Third Page'),
            ),
          ],
        )
      ],
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => "throw UnimplementedError()";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counterRestorable2, "_counterRestorable2");
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
