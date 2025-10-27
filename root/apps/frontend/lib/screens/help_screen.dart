import 'package:flutter/material.dart';
import 'package:frontend/theme/app_theme.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aiuto e Supporto'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text(
            'Domande Frequenti (FAQ)',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.textColor),
          ),
          const SizedBox(height: 16),
          _buildFaqItem(
            question: 'Come posso prendere in prestito un oggetto?',
            answer: 'Avvicinati a un locker, apri l\'app, premi il pulsante QR al centro della barra di navigazione e inquadra il codice sul vano che vuoi aprire.',
          ),
          _buildFaqItem(
            question: 'Cosa succede se trovo un oggetto danneggiato?',
            answer: 'Durante la fase di restituzione, ti verrà chiesto di valutare le condizioni dell\'oggetto. Puoi anche inviare una segnalazione diretta dalla sezione Help.',
          ),
          const SizedBox(height: 32),
          const Text(
            'Hai bisogno di altro aiuto?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.textColor),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            icon: const Icon(Icons.support_agent),
            label: const Text('Invia una segnalazione'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.primaryColor,
              side: const BorderSide(color: AppTheme.borderColor, width: 2),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Funzione di segnalazione non ancora implementata.')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem({required String question, required String answer}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.textColor)),
            const SizedBox(height: 8),
            Text(answer, style: const TextStyle(color: AppTheme.subtleTextColor, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
