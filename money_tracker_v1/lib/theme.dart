// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/BG.jpg'), // Correct path to your background image
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const CustomScaffold({required this.body, this.appBar, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Background(child: Container()), // Background image
          body, // Main content
        ],
      ),
    );
  }
}


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
