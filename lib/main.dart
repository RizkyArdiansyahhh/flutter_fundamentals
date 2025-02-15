import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/bloc/color_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
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
