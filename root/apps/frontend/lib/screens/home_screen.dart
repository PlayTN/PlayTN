import 'package:flutter/material.dart';
import 'package:frontend/screens/donations_screen.dart';
import 'package:frontend/screens/help_screen.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/screens/scanner_screen.dart';
import 'package:frontend/widgets/map_view.dart';
import 'package:frontend/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isItemBorrowed = false; // State to track if an item is borrowed

  static const List<Widget> _widgetOptions = <Widget>[
    MapView(),
    DonationsScreen(),
    ProfileScreen(),
    HelpScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onScanQrPressed() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );

    if (result != null && result is String) {
      setState(() {
        _isItemBorrowed = true; // Set item as borrowed
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Locker "$result" sbloccato con successo!'),
          backgroundColor: AppTheme.accentColor,
        ),
      );
    }
  }

  void _onReturnPressed() {
    // Logic for returning the item
    setState(() {
      _isItemBorrowed = false; // Set item as returned
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Oggetto restituito con successo!'),
        backgroundColor: AppTheme.accentColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      floatingActionButton: _isItemBorrowed
          ? FloatingActionButton.extended(
              onPressed: _onReturnPressed,
              label: const Text('RESTITUISCI'),
              icon: const Icon(Icons.keyboard_return),
              backgroundColor: Colors.orange.shade700,
            )
          : FloatingActionButton(
              onPressed: _onScanQrPressed,
              child: const Icon(Icons.qr_code_scanner),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(icon: Icons.map_outlined, index: 0, label: 'Mappa'),
            _buildNavItem(icon: Icons.card_giftcard_outlined, index: 1, label: 'Dona'),
            const SizedBox(width: 48), // Spacer for FAB
            _buildNavItem(icon: Icons.person_outline, index: 2, label: 'Profilo'),
            _buildNavItem(icon: Icons.help_outline, index: 3, label: 'Help'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index, required String label}) {
    final bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        // Reduced vertical padding to prevent overflow
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primaryColor : AppTheme.subtleTextColor,
              size: 26,
            ),
            // Reduced SizedBox height
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppTheme.primaryColor : AppTheme.subtleTextColor,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
