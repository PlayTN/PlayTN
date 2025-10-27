import 'package:flutter/material.dart';
import 'package:frontend/theme/app_theme.dart';

class DonationsScreen extends StatefulWidget {
  const DonationsScreen({super.key});

  @override
  State<DonationsScreen> createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.reset();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Richiesta di donazione inviata con successo!'),
          backgroundColor: AppTheme.accentColor, // Using theme color
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dona Attrezzatura'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Proponi la tua attrezzatura',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.textColor),
              ),
              const SizedBox(height: 8),
              const Text(
                'Se hai attrezzatura sportiva o ricreativa che non usi più, puoi donarla al progetto PlayTN. Compila il modulo e verrai ricontattato.',
                style: TextStyle(color: AppTheme.subtleTextColor, fontSize: 16),
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tipo di attrezzatura (es. Pallone)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Per favore, inserisci il tipo di attrezzatura';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Breve descrizione delle condizioni'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Per favore, descrivi le condizioni dell\'oggetto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              OutlinedButton.icon(
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Carica una foto'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.primaryColor,
                  side: const BorderSide(color: AppTheme.borderColor, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Funzione di caricamento non ancora implementata.')),
                  );
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Invia Richiesta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
