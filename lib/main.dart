import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/bloc/color_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<ColorBloc>().add(ColorToLighBluePressed());
              },
              backgroundColor: Colors.lightBlueAccent,
            ),
            SizedBox(width: 15),
            FloatingActionButton(
              onPressed: () {
                context.read<ColorBloc>().add(ColorToAmberPressed());
              },
              backgroundColor: Colors.amberAccent,
            ),
          ],
        ),
        appBar: AppBar(
          title: Text("Belajar Bloc"),
        ),
        body: Center(
          child: BlocBuilder<ColorBloc, ColorState>(
            builder: (context, state) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 100,
                height: 100,
                color: state.color,
              );
            },
          ),
        ));
  }
}
