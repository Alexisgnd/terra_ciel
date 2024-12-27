import 'package:flutter/material.dart';
import 'package:terra_ciel/pages/Météo Classique/meteo_classique_home.dart';
// (Et à toi de créer meteo_voyage_home.dart, meteo_plantes_home.dart si besoin)

class HamburgerMenu extends StatelessWidget {
  final String? meteoSelected;
  // ex. 'classique', 'voyage', 'plantes' (facultatif, si tu veux highlight le menu)

  const HamburgerMenu({super.key, this.meteoSelected});

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
            selected: (meteoSelected == 'classique'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const MeteoClassiqueHome()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.flight_takeoff),
            title: const Text('Météo voyage'),
            selected: (meteoSelected == 'voyage'),
            onTap: () {
              // TODO: aller vers la Météo VoyageHome
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (_) => const MeteoVoyageHome()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_florist),
            title: const Text('Météo des plantes'),
            selected: (meteoSelected == 'plantes'),
            onTap: () {
              // TODO: aller vers la Météo PlantesHome
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (_) => const MeteoPlantesHome()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Paramètres généraux'),
            onTap: () {
              // TODO: Navigate to Paramètres généraux
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Aide'),
            onTap: () {
              // TODO: Navigate to Aide
            },
          ),
        ],
      ),
    );
  }
}
