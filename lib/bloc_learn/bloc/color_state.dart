part of 'color_bloc.dart';

@immutable
sealed class ColorState {
  final Color color;
  const ColorState(this.color);
}

final class ColorInitial extends ColorState {
  const ColorInitial() : super(Colors.amber);
}

final class ChangedColor extends ColorState {
  ChangedColor(Color color) : super(color);
}
