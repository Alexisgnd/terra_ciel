import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final file = File('$path/data.json');

      if (await file.exists()) {
        final String response = await file.readAsString();
        final data = await json.decode(response);
        setState(() {
          _villes = List<Map<String, dynamic>>.from(data['villes_ajoutees']);
        });
      } else {
        // Load initial data from assets if file does not exist
        final String response = await rootBundle.loadString('assets/data.json');
        final data = await json.decode(response);
        setState(() {
          _villes = List<Map<String, dynamic>>.from(data['villes_ajoutees']);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _ajouterVille(String ville, int temperature, String condition,
      {int humidity = 80,
      int windSpeed = 10,
      String description = 'Aucun détail'}) async {
    setState(() {
      _villes.add({
        "ville": ville,
        "temperature": temperature,
        "condition": condition,
        "humidity": humidity,
        "windSpeed": windSpeed,
        "description": description,
      });
    });

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/data.json');
    if (!await file.exists()) {
      await file.writeAsString(json.encode({
        "villes_ajoutees": [],
        "villes_favorites": [],
        "preferences": {"theme": "light"}
      }));
    }
    final String currentData = await file.readAsString();
    final data = json.decode(currentData);

    data['villes_ajoutees'].add({
      "ville": ville,
      "temperature": temperature,
      "condition": condition,
      "humidity": humidity,
      "windSpeed": windSpeed,
      "description": description,
    });

    await file.writeAsString(json.encode(data));
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
                      ville: ville["ville"] ?? "Inconnue",
                      temperature: ville["temperature"] ?? 0,
                      condition: ville["condition"] ?? "Inconnue",
                      humidity: ville["humidity"] ?? 0,
                      windSpeed: (ville["windSpeed"] != null)
                          ? double.parse(ville["windSpeed"].toString())
                          : 0.0,
                      description: ville["description"] ?? "Pas de description",
                    );
                  }),
                  // Carte pour ajouter une nouvelle ville
                  GestureDetector(
                    onTap: _ouvrirPopUpAjoutVille,
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
