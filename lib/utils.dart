import 'package:get/get.dart';
import 'package:template_navigation/first_page.dart';
import 'package:template_navigation/main_page.dart';
import 'package:template_navigation/second_page.dart';
import 'package:template_navigation/template.dart';
import 'package:template_navigation/third_page.dart';

// Binding for better manage controllers
class Routes {
  static final List<GetPage> listOfRoutes = [
    GetPage(
      name: '/initial',
      page: () => MainPage(),
      binding: BindingsBuilder(
        () => {
          Get.put<MainController>(
            MainController(),
            permanent: true, // this controller not dispose after hot restart
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
        () => {Get.put<SecondController>(SecondController())},
      ),
    ),
    GetPage(
      name: '/third_page',
      page: () => Template(body: ThirdPage()),
      binding: BindingsBuilder(
        () => {Get.put<ThirdController>(ThirdController())},
      ),
    )
  ];
}
