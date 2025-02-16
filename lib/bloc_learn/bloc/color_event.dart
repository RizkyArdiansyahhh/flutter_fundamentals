part of 'color_bloc.dart';

@immutable
sealed class ColorEvent {}

class ColorToPinkPressed extends ColorEvent {}

class ColorToYellowPressed extends ColorEvent {}

class ColorToPurplePressed extends ColorEvent {}
