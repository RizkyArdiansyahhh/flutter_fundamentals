import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc_learn/bloc/color_bloc.dart';
import 'package:flutter_application_2/bloc_learn/bloc/counter_bloc.dart';
import 'package:flutter_application_2/ui/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ColorBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(home: MainPageBloc()),
    );
  }
}
