import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  final Color backgroundColor;
  final Widget body;
  const DraftPage(
      {super.key, required this.backgroundColor, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Multiple Bloc",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
      ),
      body: body,
    );
  }
}
