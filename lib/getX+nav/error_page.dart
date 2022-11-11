import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Get.toNamed(
                    '/initial',
                  );
                },
                child: const Text('Go back to main page'),
              ),
            ],
          ),
          const Center(
            child: Text('Error'),
          ),
        ],
      ),
    );
  }
}
