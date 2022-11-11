import 'package:flutter/material.dart';
import 'package:template_navigation/utils.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with RestorationMixin {
  final RestorableTextEditingController _controller =
      RestorableTextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          TextButton(
            child: const Text(
              'Go to Main',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.restorablePushReplacement(
                  context, Routes.myRouteBuilderMainPage);
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller.value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement restorationId
  String get restorationId => 'search_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_controller, 'controller');
  }
}
