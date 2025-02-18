import 'package:flutter/material.dart';
import 'package:flutter_application_2/post_result_model.dart';
import 'package:flutter_application_2/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult? postResult;
  User? user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Consume API"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(user != null
                  ? "${user?.id ?? ''} | ${user?.name ?? ''}"
                  : "Data Not Found"),
              ElevatedButton(
                onPressed: () async {
                  var result = await User.connectToAPi("2");

                  setState(() {
                    user = result;
                  });
                },
                child: const Text("Post"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
