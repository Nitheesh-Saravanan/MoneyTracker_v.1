import 'package:flutter/material.dart';
import 'theme.dart'; //theme file
import 'landing.dart'; //landing screen
import 'login.dart'; //login screen
import 'dashboard.dart'; //dashboard screen
import 'transaction.dart'; //transaction screen


void main() {
  runApp(MoneyTrackerV1());
}

class MoneyTrackerV1 extends StatelessWidget {
  const MoneyTrackerV1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(),
        '/login': (context) =>  LoginScreen(),

        '/dashboard': (context) =>  DashboardScreen(),

        '/transaction': (context) => TransactionScreen(initialTab: '1')

      },
    );
  }
}