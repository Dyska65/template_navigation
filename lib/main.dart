import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/error_page.dart';
import 'package:template_navigation/utils.dart';

// After Hot Restart/Reload appear arrow back this fix: "leading: const SizedBox.shrink()". This happens only if use Navigater.push....
// Controller not dispose after close screen if used GetMaterialApp with Navagator or Navigator GetX
// onUnknownRoute work with MeterialApp(), but with GetMaterialApp(). Fixed if initialRoute != '/'  https://github.com/jonataslaw/getx/issues/2407

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/initial',
      getPages: Routes.listOfRoutes,
      unknownRoute: GetPage(name: '/error', page: () => const ErrorPage()),
    );
  }
}


 // routes: {
      //   '/initial': (context) => MainPage(),
      //   '/first_page': (context) => Template(body: FirstPage()),
      //   '/second_page': (context) => Template(body: SecondPage()),
      //   '/third_page': (context) => Template(body: ThirdPage()),
      // },
     // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case '/initial':
      //       MaterialPageRoute(builder: (_) => const FirstModulePage());
      //       break;
      //     case '/second_module/secon':
      //       MaterialPageRoute(builder: (_) => const SecondModule());
      //       break;
      //     default:
      //       MaterialPageRoute(builder: (_) => const ErrorPage());
      //   }
      //   return MaterialPageRoute(builder: (_) => const ErrorPage());
      // },