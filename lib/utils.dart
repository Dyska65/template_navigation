import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/error_page.dart';
import 'package:template_navigation/first_page.dart';
import 'package:template_navigation/main_page.dart';
import 'package:template_navigation/second_page.dart';
import 'package:template_navigation/template.dart';
import 'package:template_navigation/third_page.dart';

// Binding for better manage controllers
class Routes {
  static Route<dynamic>? onGenerateRoute(settings) {
    (settings) {
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
      }
    };
  }

  static final List<GetPage> listOfRoutes = [
    GetPage(
      name: '/initial',
      page: () => MainPage(),
      binding: BindingsBuilder(
        () => {
          Get.put<MainController>(
            MainController(),
            permanent: true, // this controller not dispose after close screen
          )
        },
      ),
    ),
    GetPage(
      name: '/first_page',
      page: () => Template(body: FirstPage()),
      binding: BindingsBuilder(
        () => {
          // Example of connecting two controllers
          Get.put<FirstAddController>(FirstAddController()),
          Get.put<FirstSubtractController>(FirstSubtractController())
        },
      ),
    ),
    GetPage(
      name: '/second_page',
      page: () => Template(body: SecondPage()),
      binding: BindingsBuilder(
        // using one controller instance for two screen with help this check (?)
        () => Get.isRegistered<SecondController>()
            ? Get.find<SecondController>()
            : Get.put<SecondController>(SecondController(), permanent: true),
      ),
    ),
    GetPage(
      name: '/third_page',
      page: () => Template(body: ThirdPage()),
      binding: BindingsBuilder(
        // using one controller instance for two screen with help this check (?)
        () => Get.isRegistered<SecondController>()
            ? Get.find<SecondController>()
            : Get.put<SecondController>(SecondController(), permanent: true),
      ),
    )
  ];
}
