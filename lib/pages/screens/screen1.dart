import 'package:flutter/material.dart';
import 'package:terra_ciel/widgets/animated_logo.dart';
import 'package:terra_ciel/background/animated_background.dart';
import 'screen2.dart';
import 'package:terra_ciel/pages/Météo Classique/meteo_classique_home.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        useOrangeGradient: true,
        child: Stack(
          children: [
            // Logo
            const AnimatedLogo(rotationAngle: 158),

            // Contenu principal
            const Column(
              children: [
                SizedBox(height: 250),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Faites rayonner vos sorties !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Planifiez vos sorties en toute sérénité...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Organisez vos pique-niques...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),

            // Rectangle + Bouton
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF4E1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFA500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    onPressed: () {
                      // Aller vers la Météo Classique
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MeteoClassiqueHome(),
                        ),
                      );
                    },
                    child: const Text(
                      "Découvrir →",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Flèches latérales
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: const IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.grey),
                onPressed: null, // Désactivée sur ce premier écran
              ),
            ),
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios,
                    size: 30, color: Colors.black54),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Screen2()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}