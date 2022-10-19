import 'package:flutter/material.dart';

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
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/initial',
                    (Route<dynamic> route) => false,
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
