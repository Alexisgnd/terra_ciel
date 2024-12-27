import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Préférences'),
      ),
      body: const Center(
        child: Text(
          'Ici, configuration des Préférences pour la Météo Classique',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
