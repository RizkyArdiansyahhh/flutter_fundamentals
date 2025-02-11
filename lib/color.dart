import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ColorApp with ChangeNotifier {
  Color _color = Colors.amber;

  Color get color => _color;

  set color(Color value) {
    _color = value;
    notifyListeners();
  }
}
