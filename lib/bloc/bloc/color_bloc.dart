import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitial()) {
    on<ColorToLighBluePressed>((event, emit) {
      emit(ColorChanged(Colors.lightBlueAccent));
    });

    on<ColorToAmberPressed>((event, emit) {
      emit(ColorChanged(Colors.amberAccent));
    });
  }

  @override
  void onTransition(Transition<ColorEvent, ColorState> transition) {
    print("transition $transition");
    super.onTransition(transition);
  }

  @override
  void onChange(Change<ColorState> change) {
    print("perubahan $change");
    super.onChange(change);
  }
}
