import 'package:flutter/material.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/widgets/map_view.dart'; // We'll create this next

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MapView(), // The map screen
    ProfileScreen(), // The new profile screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onScanQrPressed() {
    // Placeholder for RF3: QR Scan
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Funzione Scansione QR non ancora implementata.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color blueColor = Colors.blue.shade800;
    final Color creamColor = const Color(0xFFF5F5DC);

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onScanQrPressed,
        backgroundColor: blueColor,
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: creamColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.map_outlined, color: _selectedIndex == 0 ? blueColor : Colors.grey.shade600),
              onPressed: () => _onItemTapped(0),
              iconSize: 30,
            ),
            IconButton(
              icon: Icon(Icons.person_outline, color: _selectedIndex == 1 ? blueColor : Colors.grey.shade600),
              onPressed: () => _onItemTapped(1),
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
