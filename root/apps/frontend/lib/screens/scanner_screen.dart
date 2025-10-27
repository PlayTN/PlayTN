import 'package:flutter/material.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white.withOpacity(0.9)),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Placeholder for camera view
          const Center(
            child: Text(
              'Camera View Placeholder',
              style: TextStyle(color: Colors.white30),
            ),
          ),

          // Scanner overlay
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.5), width: 4),
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          // Bottom section with button
          Positioned(
            bottom: 50,
            child: Column(
              children: [
                const Text(
                  'Inquadra il codice QR sul locker',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Simulate a successful scan and return a result
                    Navigator.pop(context, 'Locker Piazza Duomo');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Simula Scansione'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
