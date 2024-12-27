import 'package:flutter/material.dart';

// On importe nos 3 pages
import 'accueil_screen.dart';
import 'villes_screen.dart';
import 'preferences_screen.dart';

// Optionnel : si tu veux afficher le hamburger menu ici
import 'package:terra_ciel/widgets/hamburger_menu.dart';

class MeteoClassiqueHome extends StatefulWidget {
  const MeteoClassiqueHome({Key? key}) : super(key: key);

  @override
  State<MeteoClassiqueHome> createState() => _MeteoClassiqueHomeState();
}

class _MeteoClassiqueHomeState extends State<MeteoClassiqueHome> {
  int _selectedIndex = 0;

  // Les 3 pages
  final List<Widget> _pages = const [
    AccueilScreen(),
    VillesScreen(),
    PreferencesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Afficher le hamburger menu ici si tu le souhaites :
      drawer: const HamburgerMenu(meteoSelected: 'classique'),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Villes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Préférences',
          ),
        ],
      ),
    );
  }
}
