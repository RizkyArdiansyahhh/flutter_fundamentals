import 'package:flutter/material.dart';
import 'package:flutter_application_2/application_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => ApplicationColor(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => Text(
                  "Provider State Management",
                  style: TextStyle(color: applicationColor.color()),
                ),
              ),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 100,
                    height: 100,
                    color: applicationColor.color(),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        "AB",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Consumer<ApplicationColor>(
                        builder: (context, applicationColor, _) => Switch(
                            value: applicationColor.isBlue,
                            onChanged: (newValue) {
                              applicationColor.isBlue = newValue;
                            })),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        "AB",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  ],
                )
              ],
            ))),
      ),
    );
  }
}
