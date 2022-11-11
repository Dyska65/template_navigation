import 'package:flutter/material.dart';
import 'package:template_navigation/search.dart';
import 'package:template_navigation/utils.dart';

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

  final RestorableInt _counterRestorable = RestorableInt(0);

  @override
  String? get restorationId => "homepagestate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              child: const Text(
                'Go to Example Search',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.restorablePushReplacement(
                    context, Routes.myRouteBuilderSearchPage);
              },
            ),
            TextButton(
              child: const Text(
                'Go to Example NavBar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.restorablePushReplacement(
                    context, Routes.myRouteBuilderNavBarPage);
              },
            ),
            TextButton(
              child: const Text(
                'Go to Example ListView Scroll',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.restorablePushReplacement(
                    context, Routes.myRouteBuilderListView);
              },
            ),
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Restorable int'),
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
