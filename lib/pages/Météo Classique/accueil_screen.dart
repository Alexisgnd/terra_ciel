import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:terra_ciel/widgets/ville_card.dart';
import 'package:terra_ciel/widgets/ajout_ville_popup.dart';

class AccueilScreen extends StatefulWidget {
  const AccueilScreen({super.key});

  @override
  AccueilScreenState createState() => AccueilScreenState();
}

class AccueilScreenState extends State<AccueilScreen> {
  List<Map<String, dynamic>> _villes = [];

  @override
  void initState() {
    super.initState();
    _loadVilles();
  }

  Future<void> _loadVilles() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _villes = List<Map<String, dynamic>>.from(data['villes_ajoutees']);
    });
  }

  void _ajouterVille(String ville, int temperature, String condition) {
    setState(() {
      _villes.add({
        "ville": ville,
        "temperature": temperature,
        "condition": condition,
      });
    });
  }

  void _ouvrirPopUpAjoutVille() {
    showDialog(
      context: context,
      builder: (context) => AjoutVillePopUp(
        onVilleAdded: _ajouterVille,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('fr_FR', null);

    return Container(
      color: const Color(0xFFF4F9FF),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre "Aujourd'hui" + date
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

            // Slider horizontal des villes
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  // Affiche les cartes de villes
                  ..._villes.map((ville) {
                    return VilleCard(
                      ville: ville["ville"],
                      temperature: ville["temperature"],
                      condition: ville["condition"],
                    );
                  }).toList(),
                  // Carte pour ajouter une nouvelle ville
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
          ],
        ),
      ),
    );
  }
}
