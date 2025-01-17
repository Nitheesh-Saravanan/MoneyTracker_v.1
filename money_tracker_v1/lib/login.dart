import 'package:flutter/material.dart';
import 'theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedTab = 'Login';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTabContent(String tab) {
    switch (tab) {
      case 'Login':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email id',
                  filled: true,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(152, 255, 255, 255),
                    fontFamily: 'sans-serif Condensed',
                    fontWeight: FontWeight.w300,
                  ),
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(152, 255, 255, 255),
                    fontFamily: 'sans-serif Condensed',
                    fontWeight: FontWeight.w300,
                  ),
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 130, 37, 243),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                animationDuration: Duration(seconds: 1),
                elevation: 4,
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                enableFeedback: true,

                textStyle: TextStyle(
                  fontSize: 15,
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
                foregroundColor: Colors.white, // Set the text color to white
              ),
              child: Text("login"),
            ),
          ],
        );
      case 'Signup':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email id',
                  filled: true,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(152, 255, 255, 255),
                    fontFamily: 'sans-serif Condensed',
                    fontWeight: FontWeight.w300,
                  ),
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(152, 255, 255, 255),
                    fontFamily: 'sans-serif Condensed',
                    fontWeight: FontWeight.w300,
                  ),
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Re-Password',
                  filled: true,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(152, 255, 255, 255),
                    fontFamily: 'sans-serif Condensed',
                    fontWeight: FontWeight.w300,
                  ),
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 130, 37, 243),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                animationDuration: Duration(seconds: 1),
                elevation: 4,
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                enableFeedback: true,

                textStyle: TextStyle(
                  fontSize: 15,
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
                foregroundColor: Colors.white, // Set the text color to white
              ),
              child: Text("Signup"),
            ),
          ],
        );
      default:
        return Center(child: Text("Invalid Tab"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent('Login'),
                _buildTabContent('Signup'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTab = 'Login';
                      _tabController.animateTo(0);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedTab == 'Login'
                        ? const Color.fromARGB(255, 255, 205, 4)
                        : const Color.fromARGB(255, 253, 246, 218),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    elevation: 9,
                    surfaceTintColor: const Color.fromARGB(255, 255, 207, 33),
                    shadowColor: const Color.fromARGB(255, 255, 255, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enableFeedback: true,

                    textStyle: TextStyle(
                      fontSize: _selectedTab == 'Login' ? 25 : 20,
                      fontFamily: 'sans-serif Condensed',
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: const Color.fromARGB(49, 0, 0, 0),
                          offset: Offset(1, 1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    foregroundColor: const Color.fromARGB(
                        255, 51, 51, 51), // Set the text color to white
                  ),
                  child: Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTab = 'Signup';
                      _tabController.animateTo(1);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedTab == 'Signup'
                        ? const Color.fromARGB(255, 255, 205, 4)
                        : const Color.fromARGB(255, 253, 246, 218),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    elevation: 9,
                    surfaceTintColor: const Color.fromARGB(255, 255, 207, 33),
                    shadowColor: const Color.fromARGB(255, 255, 255, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enableFeedback: true,

                    textStyle: TextStyle(
                      fontSize: _selectedTab == 'Signup' ? 25 : 20,
                      fontFamily: 'sans-serif Condensed',
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: const Color.fromARGB(49, 0, 0, 0),
                          offset: Offset(1, 1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    foregroundColor: const Color.fromARGB(
                        255, 51, 51, 51), // Set the text color to white
                  ),
                  child: Text('Signup'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
