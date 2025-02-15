part of 'color_bloc.dart';

@immutable
sealed class ColorState {
  final Color color;
  const ColorState({required this.color});
}

final class ColorInitial extends ColorState {
  const ColorInitial() : super(color: Colors.amber);
}

final class ColorChanged extends ColorState {
  const ColorChanged(Color color) : super(color: color);
}
