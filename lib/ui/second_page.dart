import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc_learn/bloc/color_bloc.dart';
import 'package:flutter_application_2/bloc_learn/bloc/counter_bloc.dart';
import 'package:flutter_application_2/ui/draft_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPageBloc extends StatelessWidget {
  const SecondPageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, state) {
        return DraftPage(
          backgroundColor: state.color,
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<CounterBloc>().add(CounterIncrement());
                    },
                    child: Text(
                      state.value.toString(),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ColorBloc>().add(ColorToPinkPressed());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child: Text(
                      "pink",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ColorBloc>().add(ColorToYellowPressed());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    child: Text(
                      "pink",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ColorBloc>().add(ColorToPurplePressed());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: Text(
                      "pink",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        );
      },
    );
  }
}
