import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
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
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Bloc"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            backgroundColor: Colors.blueAccent,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            backgroundColor: Colors.blueAccent,
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, int>(
          listener: (context, state) {
            // TODO: implement listener
            if (state == 10) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Angka mencapai 10!')),
              );
            }
          },
          builder: (context, state) {
            return Text(
              state.toString(),
              style: TextStyle(fontSize: 50),
            );
          },
        ),
      ),
    );
  }
}
