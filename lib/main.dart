import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/error_page.dart';
import 'package:template_navigation/first_page.dart';
import 'package:template_navigation/main_page.dart';
import 'package:template_navigation/second_page.dart';
import 'package:template_navigation/template.dart';
import 'package:template_navigation/third_page.dart';

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
    return GetMaterialApp(
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
        // return MaterialPageRoute(builder: (_) => const ErrorPage());
      },
    );
  }
}

  // getPages: Routes.listOfRoutes,
  //   // unknownRoute: GetPage(name: '/error', page: () => const ErrorPage()),
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

