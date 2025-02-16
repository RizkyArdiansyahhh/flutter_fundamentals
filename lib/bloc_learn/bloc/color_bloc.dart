import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitial()) {
    on<ColorToPinkPressed>((event, emit) {
      emit(ChangedColor(Colors.pink));
    });
    on<ColorToYellowPressed>((event, emit) {
      emit(ChangedColor(Colors.yellow));
    });
    on<ColorToPurplePressed>((event, emit) {
      emit(ChangedColor(Colors.purple));
    });
  }
}
