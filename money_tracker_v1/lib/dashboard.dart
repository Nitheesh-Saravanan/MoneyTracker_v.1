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
    final double navBarWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/BG.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Column(
            children: [
              Expanded(
                child: Center(child: Text("Main Content")),
              ),
              SizedBox(
                width: navBarWidth, // Adjust the width as needed
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: BottomAppBar(
                    color: const Color.fromARGB(196, 55, 55, 55),
                    shape: AutomaticNotchedShape(RoundedRectangleBorder()),
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
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: _isExpanded ? 100 : -200, // Adjust the value to hide the popup
            left: MediaQuery.of(context).size.width * 0.05, // Center the popup
            child: AnimatedOpacity(
              opacity: _isExpanded ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Container(
                width: navBarWidth,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 130, 37, 243), // Popup background color
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToTransaction('Credit'),
                      child: Text('Credit', style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _navigateToTransaction('Debit'),
                      child: Text('Debit', style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _navigateToTransaction('OTU'),
                      child: Text('OTU', style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _navigateToTransaction('OTO'),
                      child: Text('OTO', style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleExpand,
        backgroundColor: const Color.fromARGB(255, 130, 37, 243),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: AnimatedRotation(
          turns: _isExpanded ? 0.125 : 0, // 45 degrees in turns
          duration: Duration(milliseconds: 300),
          child: Icon(Icons.add, color: Colors.white, size: 50),
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
    final double fabY = scaffoldGeometry.scaffoldSize.height - (scaffoldGeometry.floatingActionButtonSize.height + 10); // Adjust the value to place it lower
    return Offset(fabX, fabY);
  }
}