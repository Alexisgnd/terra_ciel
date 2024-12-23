import 'package:flutter/material.dart';
import 'background/animated_background.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        useOrangeGradient: false, // Change gradient if needed
        child: Stack(
          children: [
            // Logo avec rotation qui dépasse le haut de l'écran
            Positioned(
              top: -200, // Décalage pour dépasser le haut de l'écran
              left: 0,
              right: 0,
              child: Transform.rotate(
                angle: 81.85 * (3.141592653589793 / 180), // Rotation à 81.85°
                child: Image.asset(
                  'assets/logo.png',
                  width: 400,
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Contenu principal
            Column(
              children: [
                const SizedBox(height: 250), // Espace sous le logo
                const Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Marre du temps qui gâche vos vacances ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Choisissez la destination et la période idéale pour vos vacances avec notre fonction Météo de Voyage.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Découvrez quand visiter Paris pour profiter de ses beaux jours ou Bali pour éviter la saison des pluies.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Rectangle avec le bouton
                Container(
                  width: double.infinity, // Rectangle prend toute la largeur
                  decoration: const BoxDecoration(
                    color: Color(0xFFE7F3FF), // Fond bleu clair
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
                        backgroundColor: const Color(0xFF69BFFF), // Bleu vif
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40, // Largeur du bouton
                          vertical: 15, // Hauteur du bouton
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Explorer →",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
