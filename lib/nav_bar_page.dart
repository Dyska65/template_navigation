import 'package:flutter/material.dart';
import 'package:template_navigation/utils.dart';

// https://dev.to/pedromassango/what-is-state-restoration-and-how-to-use-it-in-flutter-5blm
class NavBarPage extends StatefulWidget {
  @override
  _NavBarPageState createState() => _NavBarPageState();
}

// Our state should be mixed-in with RestorationMixin
class _NavBarPageState extends State<NavBarPage> with RestorationMixin {
  // For each state, we need to use a restorable property
  final RestorableInt _index = RestorableInt(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Center(child: Text('Index is ${_index.value}')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index.value,
        onTap: (i) => setState(() => _index.value = i),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  @override
  // The restoration bucket id for this page,
  // let's give it the name of our page!
  String get restorationId => 'home_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // Register our property to be saved every time it changes,
    // and to be restored every time our app is killed by the OS!
    registerForRestoration(_index, 'nav_bar_index');
  }
}
