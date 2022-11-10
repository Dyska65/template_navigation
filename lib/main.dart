import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/error_page.dart';
import 'package:template_navigation/first_page.dart';
import 'package:template_navigation/main_page.dart';
import 'package:template_navigation/second_page.dart';
import 'package:template_navigation/template.dart';
import 'package:template_navigation/third_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

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
      navigatorKey: Get.key,
      restorationScopeId: 'app',
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
        switch (settings.name) {
          case '/initial':
            return GetPageRoute(
              settings: settings,
              routeName: '/initial',
              page: () => MainPage(),
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
        }
      },
    );
  }
}
