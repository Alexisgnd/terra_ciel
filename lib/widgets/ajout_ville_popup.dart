import 'package:flutter/material.dart';

class AjoutVillePopUp extends StatefulWidget {
  final Function(String, int, String) onVilleAdded;

  const AjoutVillePopUp({super.key, required this.onVilleAdded});

  @override
  AjoutVillePopUpState createState() => AjoutVillePopUpState();
}

class AjoutVillePopUpState extends State<AjoutVillePopUp> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _suggestions = [
    {"ville": "London", "temperature": 15, "condition": "Cloudy"},
    {"ville": "Tokyo", "temperature": 20, "condition": "Sunny"},
    {"ville": "Berlin", "temperature": 17, "condition": "Rainy"},
  ];

  List<Map<String, dynamic>> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _filteredSuggestions = _suggestions;
  }

  void _filtrerSuggestions(String query) {
    setState(() {
      _filteredSuggestions = _suggestions
          .where((v) => v["ville"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ajouter une ville'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Rechercher une ville',
              ),
              onChanged: _filtrerSuggestions,
            ),
            const SizedBox(height: 10),
            ..._filteredSuggestions.map((suggestion) {
              return ListTile(
                title: Text(suggestion['ville']),
                subtitle: Text(
                  "${suggestion['temperature']}°, ${suggestion['condition']}",
                ),
                onTap: () {
                  widget.onVilleAdded(
                    suggestion['ville'],
                    suggestion['temperature'],
                    suggestion['condition'],
                  );
                  Navigator.of(context).pop();
                },
              );
            }),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Annuler'),
        ),
      ],
    );
  }
}
