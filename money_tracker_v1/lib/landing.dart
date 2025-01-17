import 'package:flutter/material.dart';
import 'theme.dart'; //theme file

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/BG.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 200.0, bottom: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Manage\nYour\nFinances",
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Empower your Money.\nSimplify your life.",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 99, 19, 196),
                            Color.fromARGB(255, 66, 4, 142),
                          ],
                          stops: [0.0, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 130, 37, 243),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                          animationDuration: Duration(seconds: 1),
                          elevation: 4,
                          shadowColor: const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enableFeedback: true,
                          textStyle: TextStyle(
                            fontSize: 25,
                            fontFamily: 'sans-serif Condensed',
                            fontWeight: FontWeight.w300,
                            shadows: [
                              Shadow(
                                color: const Color.fromARGB(152, 0, 0, 0),
                                offset: Offset(3, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          foregroundColor: Colors.white, 
                        ),
                        child: Text("Login"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}