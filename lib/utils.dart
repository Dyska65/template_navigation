import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_navigation/getX+nav/error_page.dart';
import 'package:template_navigation/getX+nav/first_page.dart';
import 'package:template_navigation/counter_page.dart';
import 'package:template_navigation/getX+nav/second_page.dart';
import 'package:template_navigation/getX+nav/template.dart';
import 'package:template_navigation/getX+nav/third_page.dart';
import 'package:template_navigation/list_view_page.dart';
import 'package:template_navigation/nav_bar_page.dart';
import 'package:template_navigation/search.dart';

// Binding for better manage controllers
class Routes {
  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return GetPageRoute(
      routeName: '/erorr',
      page: () => const ErrorPage(),
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
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
  }

  static Route<void> myRouteBuilderSearchPage(
      BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => SearchPage(),
    );
  }

  static Route<void> myRouteBuilderNavBarPage(
      BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => NavBarPage(),
    );
  }

  static Route<void> myRouteBuilderListView(
      BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const ListViewPage(),
    );
  }

  static Route<void> myRouteBuilderMainPage(
      BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const MainPage(),
    );
  }
}

class Email {
  final String? title;
  final String? description;
  final String? subject;
  final String? day;

  Email({
    this.title,
    this.day,
    this.subject,
    this.description,
  });
}

final List<Email> emails = [
  Email(
    title: 'Flutter Karachi',
    day: 'Friday',
    subject: 'Fluttering',
    description: 'Let\'s get into code with Flutter',
  ),
  Email(
    title: 'Google',
    day: 'Monday',
    subject: 'Security alert',
    description: 'New device signed in to your google account',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'Netflix',
    day: 'Saturday',
    subject: 'Coming soon!',
    description:
        'Blacklist season 8, and 6 other shows are coming soon on Netflix',
  ),
  Email(
    title: 'Adobe',
    day: 'Sunday',
    subject: 'Security profile changed',
    description:
        'Your security profile has been changed. A new phone number has been added to your profile.',
  ),
  Email(
    title: 'Azure DevOps',
    day: 'Monday',
    subject: 'Build failed',
    description:
        'Your build named Flutter Karachi has failed. Click here to view the details.',
  ),
  Email(
    title: 'GitHub',
    day: 'Tuesday',
    subject: 'New comment on issue',
    description: 'Issue 2343 has a new comment on your repository.',
  ),
  Email(
    title: 'TestFlight',
    day: 'Friday',
    subject: 'Flutter Pakistan (early access) 1.0.5',
    description:
        'Flutter Pakistan is available to test on your Test Flight application',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
  Email(
    title: 'App Center Team',
    day: 'Saturday',
    subject: 'Build successful',
    description:
        'A new version of Flutter Pakistan is available on the Play Store to test.',
  ),
  Email(
    title: 'Waleed',
    day: 'Saturday',
    subject: 'State restoration',
    description: 'Some tips and tricks regarding state restoration',
  ),
  Email(
    title: 'Amazon',
    day: 'Tuesday',
    subject: 'Order update',
    description: 'Your order has been confirmed',
  ),
  Email(
    title: 'Daraz',
    day: 'Wednesday',
    subject: 'Refund successful',
    description:
        'You have been refunded your order against the tracking number 456635872354.',
  ),
];
