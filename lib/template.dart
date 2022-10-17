import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  const Template(
      {Key? key,
      this.appBarText = 'Default AppBar',
      this.footerText = 'Default Footer',
      required this.body})
      : super(key: key);

  final String appBarText;
  final String footerText;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
        leading: const SizedBox.shrink(),
      ),
      bottomNavigationBar: Text(
        footerText,
        textAlign: TextAlign.center,
      ),
      body: body,
    );
  }
}
