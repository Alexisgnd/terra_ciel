import 'package:flutter/material.dart';
import 'background/animated_background.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        useGreenGradient: true, // Utilise le dégradé vert spécifique
        child: Stack(
          children: [
            // Logo avec rotation qui dépasse le haut de l'écran
            Positioned(
              top: -200, // Décalage pour dépasser le haut de l'écran
              left: 0,
              right: 0,
              child: Transform.rotate(
                angle: 38 * (3.141592653589793 / 180), // Rotation à 38°
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
                            "Votre météo personnalisée",
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
                            "Recevez des prévisions météorologiques précises et personnalisées pour votre emplacement.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Planifiez vos activités en toute confiance grâce à nos prévisions détaillées.",
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
                    color: Color(0xFFB4FFA0), // Fond vert clair
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
                        backgroundColor: const Color(0xFF69FFB4), // Vert vif
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
                        "Découvrir →",
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
