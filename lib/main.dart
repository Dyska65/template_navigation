import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template_navigation/utils.dart';

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
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      restorationScopeId: 'app',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/initial',
      onUnknownRoute: ((RouteSettings settings) =>
          Routes.onUnknownRoute(settings)),
      onGenerateRoute: ((RouteSettings settings) =>
          Routes.onGenerateRoute(settings)),
    );
  }
}
