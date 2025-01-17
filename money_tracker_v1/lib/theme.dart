// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 68,
          fontWeight: FontWeight.normal,
          color: const Color.fromARGB(255, 255, 255, 255),
          shadows: [
            Shadow(
              color: const Color.fromARGB(174, 37, 37, 37),
              offset: Offset(1, 1),
              blurRadius: 4,
            ),
          ]),
      bodyLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: const Color.fromARGB(255, 247, 254, 145),
          ),
      bodySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: const Color.fromARGB(255, 248, 251, 198),
          ),
    ),
  );
}
