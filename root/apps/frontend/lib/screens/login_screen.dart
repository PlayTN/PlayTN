import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _launchSpidLogin() async {
    final Uri spidLoginUrl = Uri.parse('https://login.spid.gov.it');
    if (!await launchUrl(spidLoginUrl)) {
      throw 'Could not launch $spidLoginUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define the new color palette
    final Color creamColor = const Color(0xFFF5F5DC);
    final Color blueColor = Colors.blue.shade800;

    return Scaffold(
      backgroundColor: creamColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Placeholder for logo
                Icon(
                  Icons.sports_soccer, // Placeholder icon
                  size: 80,
                  color: blueColor,
                ),
                const SizedBox(height: 20),
                Text(
                  'PlayTN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blueColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),

                // Form Fields
                TextFormField(
                  decoration: _buildInputDecoration(label: 'Username o Email', color: blueColor),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: _buildInputDecoration(label: 'Password', color: blueColor),
                ),
                const SizedBox(height: 40),

                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text(
                    'Accedi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

                // SPID Button
                TextButton(
                  onPressed: _launchSpidLogin,
                  child: Text(
                    'Entra con SPID / CIE',
                    style: TextStyle(color: blueColor, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({required String label, required Color color}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black54),
      filled: true,
      fillColor: Colors.white.withOpacity(0.7),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: color, width: 2.0),
      ),
    );
  }
}
