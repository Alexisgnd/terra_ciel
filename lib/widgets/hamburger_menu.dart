import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF2D4379),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.wb_sunny),
            title: const Text('Météo classique'),
            onTap: () {
              // Navigate to Météo classique
            },
          ),
          ListTile(
            leading: const Icon(Icons.flight_takeoff),
            title: const Text('Météo voyage'),
            onTap: () {
              // Navigate to Météo voyage
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_florist),
            title: const Text('Météo des plantes'),
            onTap: () {
              // Navigate to Météo des plantes
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Paramètres généraux'),
            onTap: () {
              // Navigate to Paramètres généraux
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Aide'),
            onTap: () {
              // Navigate to Aide
            },
          ),
        ],
      ),
    );
  }
}