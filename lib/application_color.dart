import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isBlue = true;

  bool get isBlue => _isBlue;
  set isBlue(bool value) {
    _isBlue = value;
    notifyListeners();
  }

  Color color() => (_isBlue) ? Colors.blue : Colors.amber;
}
