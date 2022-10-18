import 'package:get/get.dart';
import 'package:template_navigation/first_page.dart';
import 'package:template_navigation/main_page.dart';
import 'package:template_navigation/second_page.dart';
import 'package:template_navigation/template.dart';
import 'package:template_navigation/third_page.dart';

// Binding?
class Routes {
  static final List<GetPage> listOfRoutes = [
    GetPage(
      name: '/',
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
          Get.put<FirstAddController>(
            FirstAddController(),
            permanent: true, // this controller not dispose after hot restart
          ),
          Get.put<FirstSubtractController>(
            FirstSubtractController(),
            permanent: true, // this controller not dispose after hot restart
          )
        },
      ),
    ),
    GetPage(
      name: '/second_page',
      page: () => Template(body: SecondPage()),
    ),
    GetPage(
      name: '/third_page',
      page: () => Template(body: ThirdPage()),
    )
  ];
}
