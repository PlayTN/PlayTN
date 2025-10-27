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
    // Calculate the available height to ensure the column can be centered
    final screenHeight = MediaQuery.of(context).size.height;
    final safeAreaPadding = MediaQuery.of(context).padding;
    final availableHeight = screenHeight - safeAreaPadding.top - safeAreaPadding.bottom;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            height: availableHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.sports_soccer,
                  size: 80,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 20),
                Text(
                  'PlayTN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),

                // Form fields now take their style from the central theme
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Username o Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 40),

                // Buttons now take their style from the central theme
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text('Accedi'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _launchSpidLogin,
                  child: const Text('Entra con SPID / CIE'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
