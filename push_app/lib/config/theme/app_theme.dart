import 'package:flutter/material.dart';

class AppTheme {
  final color = Colors.deepPurple;

  ThemeData getTheme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: color);
  }
}
