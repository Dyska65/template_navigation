import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with RestorationMixin {
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counterRestorable, "_counterRestorable");
  }

  RestorableInt _counterRestorable = RestorableInt(0);

  @override
  String? get restorationId => "homepagestate";

  @override
  Widget build(BuildContext context) {
    print('_MainPageState');
    print(_counterRestorable.value++);
    return Scaffold(
      appBar: AppBar(
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
                  onPressed: () => Get.toNamed(
                    '____',
                  ),
                ),
                TextButton(
                  child: const Text('Go to Screens'),
                  onPressed: () => Get.toNamed(
                    '/first_page',
                    arguments: 'Argument from MainPage',
                  ),
                ),
              ],
            ),
            const Text(
                'Permanent controller, rebuild only if tapped hot restart/reload'),
            Container(
              width: 150,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(_counterRestorable.value.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          _counterRestorable.value++;

                          setState(() {});
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          _counterRestorable.value--;

                          setState(() {});
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
