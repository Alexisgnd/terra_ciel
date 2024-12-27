import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import 'package:terra_ciel/widgets/ajout_ville_popup.dart';

class VillesScreen extends StatefulWidget {
  const VillesScreen({super.key});

  @override
  VillesScreenState createState() => VillesScreenState();
}

class VillesScreenState extends State<VillesScreen> {
  List<Map<String, dynamic>> _villes = [];

  @override
  void initState() {
    super.initState();
    _loadVilles();
  }

  Future<void> _loadVilles() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/data.json');
      if (await file.exists()) {
        final String response = await file.readAsString();
        final data = json.decode(response);
        setState(() {
          _villes = List<Map<String, dynamic>>.from(data['villes_ajoutees']);
        });
      } else {
        final String response = await rootBundle.loadString('assets/data.json');
        final data = json.decode(response);
        setState(() {
          _villes = List<Map<String, dynamic>>.from(data['villes_ajoutees']);
        });
      }
    } catch (_) {
      setState(() => _villes = []);
    }
  }

  Future<void> _saveVilles() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/data.json');

    if (!await file.exists()) {
      await file.writeAsString(json.encode({
        "villes_ajoutees": [],
        "villes_favorites": [],
        "preferences": {"theme": "light"}
      }));
    }

    final data = {
      "villes_ajoutees": _villes,
      "villes_favorites": [],
      "preferences": {"theme": "light"}
    };
    await file.writeAsString(json.encode(data));
  }

  Future<void> _ajouterVille(String ville, int temperature, String condition) async {
    setState(() {
      _villes.add({
        "ville": ville,
        "temperature": temperature,
        "condition": condition,
      });
    });
    await _saveVilles();
  }

  Future<void> _supprimerVille(int index) async {
    setState(() {
      _villes.removeAt(index);
    });
    await _saveVilles();
  }

  Future<void> _reorderVilles(int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) newIndex--;
    setState(() {
      final item = _villes.removeAt(oldIndex);
      _villes.insert(newIndex, item);
    });
    await _saveVilles();
  }

  void _ouvrirPopUpAjoutVille() {
    showDialog(
      context: context,
      builder: (context) => AjoutVillePopUp(
        onVilleAdded: (ville, temperature, condition) =>
            _ajouterVille(ville, temperature, condition),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ReorderableListView(
            onReorder: _reorderVilles,
            children: [
              for (int i = 0; i < _villes.length; i++)
                ListTile(
                  key: ValueKey(_villes[i]),
                  title: Text(_villes[i]["ville"] ?? "Inconnue"),
                  subtitle: Text(
                    "Temp: ${_villes[i]["temperature"] ?? 0}°, "
                    "Cond: ${_villes[i]["condition"] ?? "Inconnue"}",
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _supprimerVille(i),
                  ),
                ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: _ouvrirPopUpAjoutVille,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('+ Ajouter'),
            ),
          ),
        ],
      ),
    );
  }
}