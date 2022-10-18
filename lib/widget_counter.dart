import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetCounter extends StatelessWidget {
  WidgetCounter(
      {Key? key, required this.controllerAdd, this.controllerSubtract})
      : super(key: key);

  dynamic controllerAdd;
  dynamic controllerSubtract;

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
            Text(controllerAdd.value.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    controllerAdd.add();
                  },
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    controllerSubtract ??= controllerAdd;
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
