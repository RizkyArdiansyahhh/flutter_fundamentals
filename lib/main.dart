import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/counter_bloc.dart';
import 'package:flutter_application_2/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(home: MainPage()),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterEvent(value: 10));
            },
            backgroundColor: Colors.blueAccent,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, int>(
          listener: (context, state) {
            print(state);
          },
          builder: (context, state) {
            return Text(
              state.toString(),
              style: TextStyle(fontSize: 30),
            );
          },
        ),
      ),
    );
  }
}
