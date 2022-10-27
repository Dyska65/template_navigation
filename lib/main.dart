import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/error_page.dart';
import 'package:template_navigation/first_page.dart';
import 'package:template_navigation/main_page.dart';
import 'package:template_navigation/second_page.dart';
import 'package:template_navigation/template.dart';
import 'package:template_navigation/third_page.dart';
import 'package:template_navigation/utils.dart';

// After Hot Restart/Reload appear arrow back this fix: "leading: const SizedBox.shrink()". This happens only if use Navigater.push....
// Controller not dispose after close screen if used GetMaterialApp with Navagator or Navigator GetX
// onUnknownRoute work with MaterialApp(), but with GetMaterialApp(). Fixed if initialRoute != '/'  https://github.com/jonataslaw/getx/issues/2407

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/initial',
      onUnknownRoute: ((settings) {
        return GetPageRoute(
          routeName: '/erorr',
          page: () => const ErrorPage(),
        );
      }),
      onGenerateRoute: (settings) {
        // print(settings.name);
        // print(settings.arguments);
        // },
        switch (settings.name) {
          case '/initial':
            return GetPageRoute(
              settings: settings,
              routeName: '/initial',
              page: () => MainPage(),
              binding: BindingsBuilder(
                () => {
                  Get.put<MainController>(
                    MainController(),
                    permanent:
                        true, // this controller not dispose after close screen
                  )
                },
              ),
            );
          case '/first_page':
            return GetPageRoute(
              settings: settings,
              routeName: '/first_page',
              page: () => Template(body: FirstPage()),
              binding: BindingsBuilder(
                () => {
                  // Example of connecting two controllers
                  Get.put<FirstAddController>(FirstAddController()),
                  Get.put<FirstSubtractController>(FirstSubtractController())
                },
              ),
            );
          case '/second_page':
            return GetPageRoute(
              settings: settings,
              routeName: '/second_page',
              page: () => Template(body: SecondPage()),
              binding: BindingsBuilder(
                // using one controller instance for two screen with help this check (?)
                () => Get.isRegistered<SecondController>()
                    ? Get.find<SecondController>()
                    : Get.put<SecondController>(SecondController(),
                        permanent: true),
              ),
            );
          case '/third_page':
            return GetPageRoute(
              settings: settings,
              routeName: '/third_page',
              page: () => Template(body: ThirdPage()),
              binding: BindingsBuilder(
                // using one controller instance for two screen with help this check (?)
                () => Get.isRegistered<SecondController>()
                    ? Get.find<SecondController>()
                    : Get.put<SecondController>(SecondController(),
                        permanent: true),
              ),
            );
          default:
          // MaterialPageRoute(builder: (_) => const ErrorPage());
        }
        return MaterialPageRoute(builder: (_) => const ErrorPage());
      },
      // routes: Routes.routesList,
      // getPages: Routes.listOfRoutes,
    );
  }
}



  /* Setup for Restoration and how tested
iOS:
XCode in Runner-> Main ->Flutter View Controller-> restoration ID: "input your ID"
Run only XCode after change state app, move to background this app,
after stop app in XCode and open from background app
ANDROID:
Can open in debug mode, but emulator needed setup. In emulator open Settings-> Emulator-> Switch to Mode Developer->
 ->Open Settings-> System-> For Developer -> Switch to "Don't keep activities"
 Run F5 changed state and move to background this app, after open 
 WEB:
Run only from terminal with command flutter run --profile or flutter run --release, 
after go to another page and back, after changed state and tap to back or forward button 
and after back to current page and you can see old state
 */

// import 'package:flutter/material.dart';

// void main() => runApp(const RestorationExampleApp());

// class RestorationExampleApp extends StatelessWidget {
//   const RestorationExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       restorationScopeId: 'app',
//       title: 'Restorable Counter',
//       home: RestorableCounter(restorationId: 'counter'),
//     );
//   }
// }

// class RestorableCounter extends StatefulWidget {
//   const RestorableCounter({super.key, this.restorationId});

//   final String? restorationId;

//   @override
//   State<RestorableCounter> createState() => _RestorableCounterState();
// }

// // The [State] object uses the [RestorationMixin] to make the current value
// // of the counter restorable.
// class _RestorableCounterState extends State<RestorableCounter>
//     with RestorationMixin {
//   // The current value of the counter is stored in a [RestorableProperty].
//   // During state restoration it is automatically restored to its old value.
//   // If no restoration data is available to restore the counter from, it is
//   // initialized to the specified default value of zero.
//   final RestorableInt _counter = RestorableInt(0);

//   // In this example, the restoration ID for the mixin is passed in through
//   // the [StatefulWidget]'s constructor.
//   @override
//   String? get restorationId => widget.restorationId;

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     // All restorable properties must be registered with the mixin. After
//     // registration, the counter either has its old value restored or is
//     // initialized to its default value.
//     registerForRestoration(_counter, 'count');
//   }

//   void _incrementCounter() {
//     setState(() {
//       // The current value of the property can be accessed and modified via
//       // the value getter and setter.
//       _counter.value++;
//     });
//   }

//   @override
//   void dispose() {
//     _counter.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Restorable Counter'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '${_counter.value}',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
