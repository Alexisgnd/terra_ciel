import 'package:flutter/material.dart';
import 'package:terra_ciel/widgets/ajout_ville_popup.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class VillesScreen extends StatefulWidget {
  const VillesScreen({super.key});

  @override
  _VillesScreenState createState() => _VillesScreenState();
}

class _VillesScreenState extends State<VillesScreen> {
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
      _villes.add({"ville": ville, "temperature": temperature, "condition": condition});
    });
  }

  void _supprimerVille(int index) {
    setState(() {
      _villes.removeAt(index);
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
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      appBar: AppBar(
        title: const Text('Villes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _ouvrirPopUpAjoutVille,
          ),
        ],
      ),
      body: SafeArea(
        child: ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final item = _villes.removeAt(oldIndex);
              _villes.insert(newIndex, item);
            });
          },
          children: [
            for (int index = 0; index < _villes.length; index++)
              Dismissible(
                key: ValueKey(_villes[index]),
                onDismissed: (direction) {
                  _supprimerVille(index);
                },
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text(_villes[index]['ville']),
                  subtitle: Text("${_villes[index]['temperature']}°, ${_villes[index]['condition']}"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}