import 'package:flutter/material.dart';

class ThemeHandler extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get thememode => _themeMode;
  void changeTheme() {
    if (_themeMode == ThemeMode.light) {
      print("Current Theme :Dark");
      _themeMode = ThemeMode.dark;
    } else {print("Current Theme :Light");
      _themeMode = ThemeMode.light;
    }

    notifyListeners();
  }
}
