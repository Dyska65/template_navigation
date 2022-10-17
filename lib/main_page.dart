import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to first module'),
        leading: const SizedBox.shrink(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: const Text('Go to Screens'),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/first_page',
                (Route<dynamic> route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
