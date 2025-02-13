import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent {
  toRed,
  toYellow,
  toGreen,
}

class ColorState {
  final Color color;
  ColorState(this.color);
}

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState(Colors.red)) {
    on<ColorEvent>((event, emit) {
      if (event == ColorEvent.toRed) {
        emit(ColorState(Colors.red));
      } else if (event == ColorEvent.toGreen) {
        emit(ColorState(Colors.green));
      } else if (event == ColorEvent.toYellow) {
        emit(ColorState(Colors.yellow));
      }
    });
  }
}
