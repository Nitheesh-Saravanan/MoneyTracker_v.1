import 'package:flutter/material.dart';
import 'transaction.dart'; // Make sure to import the TransactionScreen

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _navigateToTransaction(String tab) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TransactionScreen(initialTab: tab),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Dashboard"), elevation: 0,
                centerTitle: true,
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
       ),
      body: Center(child: Text("Main Content")),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home_rounded, color: Colors.white, size: 38),
              onPressed: () {},
            ),
            SizedBox(width: 30), // Space for the floating action button
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white, size: 38),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _isExpanded ? 180 : 60,
        height: _isExpanded ? 230 : 60,
        child: FloatingActionButton(
          onPressed: _toggleExpand,
          backgroundColor: const Color.fromARGB(255, 130, 37, 243),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_isExpanded ? 40.0 : 28.0),
          ),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _isExpanded
                ? SingleChildScrollView(
                    key: ValueKey<bool>(_isExpanded),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => _navigateToTransaction('Credit'),
                          child: AnimatedOpacity(
                            opacity: _isExpanded ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: Text('Credit', style: TextStyle(fontSize: 25, color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _navigateToTransaction('Debit'),
                          child: AnimatedOpacity(
                            opacity: _isExpanded ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: Text('Debit', style: TextStyle(fontSize: 25, color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _navigateToTransaction('OTU'),
                          child: AnimatedOpacity(
                            opacity: _isExpanded ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: Text('OTU', style: TextStyle(fontSize: 25, color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _navigateToTransaction('OTO'),
                          child: AnimatedOpacity(
                            opacity: _isExpanded ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: Text('OTO', style: TextStyle(fontSize: 25, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  )
                : Icon(
                    Icons.add,
                    key: ValueKey<bool>(_isExpanded),
                    color: Colors.white,
                    size: 50,
                    blendMode: BlendMode.lighten,
                  ),
          ),
        ),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(),
    );
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width) / 2;
    final double fabY = scaffoldGeometry.scaffoldSize.height - scaffoldGeometry.floatingActionButtonSize.height - 40; // Adjust the value to place it lower
    return Offset(fabX, fabY);
  }
}