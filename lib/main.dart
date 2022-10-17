import 'package:flutter/material.dart';
import 'package:template_navigation/error_page.dart';
import 'package:template_navigation/first_page.dart';
import 'package:template_navigation/main_page.dart';
import 'package:template_navigation/second_page.dart';
import 'package:template_navigation/template.dart';
import 'package:template_navigation/third_page.dart';

// После Hot Restart появляется arrow back решается leading: const SizedBox.shrink(),

void main() {
  runApp(const FirstModule());
}

class FirstModule extends StatelessWidget {
  const FirstModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/first_page': (context) => const Template(body: FirstPage()),
        '/second_page': (context) => const Template(body: SecondPage()),
        '/third_page': (context) => const Template(body: ThirdPage()),
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const ErrorPage(),
        );
      },
    );
  }
}

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