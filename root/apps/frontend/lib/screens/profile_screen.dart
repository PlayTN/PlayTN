import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color blueColor = Colors.blue.shade800;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC), // Cream color
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5DC),
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
        title: Text(
          'Profilo Utente',
          style: TextStyle(
            color: blueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80, color: Colors.black26),
            SizedBox(height: 20),
            Text(
              'Sezione Profilo',
              style: TextStyle(fontSize: 22, color: Colors.black54),
            ),
            Text(
              'Qui verranno mostrate le statistiche e le preferenze.',
              style: TextStyle(fontSize: 16, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
