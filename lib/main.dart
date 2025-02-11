import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/color_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  ColorBloc bloc = ColorBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "BLOC State Management",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
            child: StreamBuilder<Color>(
                stream: bloc.stateStream,
                initialData: Colors.amber,
                builder: (context, snapshot) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 100,
                    height: 100,
                    color: snapshot.data,
                  );
                })),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.toAmber);
              },
              backgroundColor: Colors.amberAccent,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.toLightBlue);
              },
              backgroundColor: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
