import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetCounter extends StatelessWidget {
  WidgetCounter({Key? key, required this.controller, this.controllerSubtract})
      : super(key: key);

  final controller;
  var controllerSubtract;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 150,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(controller.value.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    controller.add();
                  },
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    controllerSubtract ??= controller;
                    controllerSubtract.subtract();
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
