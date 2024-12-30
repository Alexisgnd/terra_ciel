import 'package:flutter/material.dart';
import 'accueil_screen.dart';
import 'villes_screen.dart';
import 'preferences_screen.dart';
import 'package:terra_ciel/widgets/hamburger_menu.dart';

class MeteoClassiqueHome extends StatefulWidget {
  const MeteoClassiqueHome({super.key});

  @override
  State<MeteoClassiqueHome> createState() => _MeteoClassiqueHomeState();
}

class _MeteoClassiqueHomeState extends State<MeteoClassiqueHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    AccueilScreen(),   // Page d'accueil
    VillesScreen(),    // Page des villes
    PreferencesScreen(), // Page des préférences
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Le Drawer (hamburger menu)
      drawer: const HamburgerMenu(meteoSelected: 'classique'),

      // Une AppBar minimaliste
      appBar: AppBar(
        // On met une légère élévation pour la séparer du reste
        elevation: 1,
        // Fond gris clair
        backgroundColor: const Color(0xFFE6E6E6),
        // On retire le titre par défaut
        automaticallyImplyLeading: false,

        // On construit notre "header" perso
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Bouton hamburger
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Color(0xFF2D4379)),
                  onPressed: () {
                    // Ouvre le Drawer parent
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            // Avatar gris à droite
            const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFA6A6A6),
              child: Icon(
                Icons.person,
                size: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),

      // Corps : on affiche l'onglet sélectionné
      body: _pages[_selectedIndex],

      // Barre de navigation en bas (3 onglets : Accueil, Villes, Préférences)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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
