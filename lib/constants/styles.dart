import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle title = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.deepPurple,
  );

  static TextStyle itensTitle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textButton = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[900],
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    primary: Colors.deepPurple,
    onPrimary: Colors.white,
    surface: Colors.grey[900],
    onSurface: Colors.grey[100],
  ),
  useMaterial3: true,
);
