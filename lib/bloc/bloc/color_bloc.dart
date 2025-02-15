// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends HydratedBloc<ColorEvent, ColorState> {
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

  @override
  ColorState? fromJson(Map<String, dynamic> json) {
    try {
      return ColorChanged(Color.fromRGBO(json['color']['r'], json['color']['g'],
          json['color']['b'], json['color']['o']));
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ColorState state) {
    try {
      return {
        'color': {
          'r': state.color.r,
          'g': state.color.g,
          'b': state.color.b,
          'o': state.color.a,
        }
      };
    } catch (_) {
      return null;
    }
  }
}
