import 'package:flutter/material.dart';
import 'background/animated_background.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        useOrangeGradient: true, // Utilise le dégradé orangé spécifique
        child: Stack(
          children: [
            // Logo avec rotation qui dépasse le haut de l'écran
            Positioned(
              top: -200, // Décalage pour dépasser le haut de l'écran
              left: 0,
              right: 0,
              child: Transform.rotate(
                angle: 158 * (3.141592653589793 / 180), // Rotation à 255°
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
                            "Faites rayonner vos sorties !",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Planifiez vos sorties en toute sérénité grâce à nos prévisions météorologiques précises et personnalisées.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Organisez vos pique-niques, sorties en famille ou escapades entre amis en toute confiance.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF4E1), // Fond orange clair
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
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFA500), // Orange vif
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Découvrir →",
                      style: TextStyle(fontSize: 18),
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
