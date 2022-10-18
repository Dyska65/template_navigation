import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/error_page.dart';
import 'package:template_navigation/first_page.dart';
import 'package:template_navigation/main_page.dart';
import 'package:template_navigation/second_page.dart';
import 'package:template_navigation/template.dart';
import 'package:template_navigation/third_page.dart';
import 'package:template_navigation/utils.dart';

// После Hot Restart появляется arrow back решается leading: const SizedBox.shrink(),
// Controller not dispose after close screen if used GetMaterialApp with Navagator or Navigator GetX
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
      initialRoute: '/',
      getPages: Routes.listOfRoutes,
      unknownRoute: GetPage(name: '/notfound', page: () => const ErrorPage()),
    );
  }
}


 // routes: {
      //   '/': (context) => MainPage(),
      //   '/first_page': (context) => Template(body: FirstPage()),
      //   '/second_page': (context) => Template(body: SecondPage()),
      //   '/third_page': (context) => Template(body: ThirdPage()),
      // },
     // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case '/':
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