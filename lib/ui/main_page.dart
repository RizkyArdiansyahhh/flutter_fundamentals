import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc_learn/bloc/color_bloc.dart';
import 'package:flutter_application_2/bloc_learn/bloc/counter_bloc.dart';
import 'package:flutter_application_2/ui/draft_page.dart';
import 'package:flutter_application_2/ui/second_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageBloc extends StatelessWidget {
  const MainPageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, state) {
        return DraftPage(
            backgroundColor: state.color,
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) {
                        return Text(
                          state.value.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondPageBloc()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: state.color,
                          ),
                          child: Text(
                            "Click To Change",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            ));
      },
    );
  }
}
