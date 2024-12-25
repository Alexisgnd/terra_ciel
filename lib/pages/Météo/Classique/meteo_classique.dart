import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:terra_ciel/widgets/navbar_widget.dart';
import 'package:terra_ciel/widgets/ville_card.dart';
import 'package:terra_ciel/widgets/ajout_ville_popup.dart';

class MeteoClassique extends StatefulWidget {
  const MeteoClassique({super.key});

  @override
  _MeteoClassiqueState createState() => _MeteoClassiqueState();
}

class _MeteoClassiqueState extends State<MeteoClassique> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _villes = [
    {"ville": "Madiun", "temperature": 25, "condition": "Mostly Sunny"},
    {"ville": "Paris", "temperature": 18, "condition": "Cloudy"},
    {"ville": "New York", "temperature": 22, "condition": "Rainy"},
  ];

  void _ajouterVille(String ville, int temperature, String condition) {
    setState(() {
      _villes.add(
          {"ville": ville, "temperature": temperature, "condition": condition});
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _ouvrirPopUpAjoutVille() {
    showDialog(
      context: context,
      builder: (context) => AjoutVillePopUp(onVilleAdded: _ajouterVille),
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('fr_FR', null);
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header avec le menu hamburger et la photo de profil
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu hamburger
                  IconButton(
                    icon: const Icon(Icons.menu,
                        size: 28, color: Color(0xFF2D4379)),
                    onPressed: () {
                      // Action pour le menu
                    },
                  ),
                  // Photo de profil ronde
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300], // Placeholder gris
                    child: const Icon(
                      Icons.person,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Section "Aujourd'hui" et date
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Aujourd'hui",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D4379),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('EEEE d MMMM y', 'fr_FR').format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF7B8EA9),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // Slider des villes
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  ..._villes.map((ville) {
                    return VilleCard(
                      ville: ville["ville"],
                      temperature: ville["temperature"],
                      condition: ville["condition"],
                    );
                  }),
                  // Carte grise pour ajouter une ville
                  GestureDetector(
                    onTap: _ouvrirPopUpAjoutVille,
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.add, size: 50, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Barre de navigation
            NavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          ],
        ),
      ),
    );
  }
}
