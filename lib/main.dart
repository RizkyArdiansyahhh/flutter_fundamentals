import 'package:flutter/material.dart';
import 'package:flutter_application_2/post_result_model.dart';

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
              Text(postResult != null
                  ? "${postResult?.jsonrpc ?? ''} | ${postResult?.result ?? ''} | ${postResult?.id ?? 0}"
                  : "Data Not Found"),
              ElevatedButton(
                onPressed: () async {
                  var result = await PostResult.connectToApi(
                    "2.0",
                    "apiinfo.version",
                    {},
                    1,
                  );

                  setState(() {
                    postResult = result;
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
