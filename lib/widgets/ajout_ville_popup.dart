import 'package:flutter/material.dart';

class AjoutVillePopUp extends StatefulWidget {
  final Function(String, int, String) onVilleAdded;

  const AjoutVillePopUp({super.key, required this.onVilleAdded});

  @override
  _AjoutVillePopUpState createState() => _AjoutVillePopUpState();
}

class _AjoutVillePopUpState extends State<AjoutVillePopUp> {
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
          .where((ville) =>
              ville["ville"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ajouter une ville"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _searchController,
            onChanged: _filtrerSuggestions,
            decoration: const InputDecoration(
              labelText: "Rechercher une ville",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200, // Hauteur fixe pour éviter les exceptions
            child: ListView(
              children: _filteredSuggestions.map((ville) {
                return ListTile(
                  title: Text(ville["ville"]),
                  subtitle:
                      Text("${ville["temperature"]}°, ${ville["condition"]}"),
                  onTap: () {
                    widget.onVilleAdded(
                      ville["ville"],
                      ville["temperature"],
                      ville["condition"],
                    );
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Annuler"),
        ),
      ],
    );
  }
}
