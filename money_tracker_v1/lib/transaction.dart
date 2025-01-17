import 'package:flutter/material.dart';
import 'theme.dart';

class TransactionScreen extends StatefulWidget {
  final String initialTab;

  const TransactionScreen({super.key, required this.initialTab});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  late String _currentTab;

  @override
  void initState() {
    super.initState();
    _currentTab = widget.initialTab;
  }

  Widget _buildTabContent(String tab) {
    switch (tab) {
      case 'Credit':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Credit Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Source',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        );
      case 'Debit':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Debit Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Reason',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        );
      case 'OTU':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount Owed to You',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Person',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        );
      case 'OTO':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount You Owed',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Person',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        );
      default:
        return Center(child: Text("Invalid Tab"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction Screen"),
        elevation: 0,
      ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: _buildTabContent(_currentTab),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 205, 4),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    elevation: 9,
                    surfaceTintColor: const Color.fromARGB(255, 255, 207, 33),
                    shadowColor: const Color.fromARGB(255, 255, 255, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enableFeedback: true,
                    textStyle: TextStyle(
                      fontSize: 25,
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
                    foregroundColor: const Color.fromARGB(255, 51, 51, 51),
                  ),
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}