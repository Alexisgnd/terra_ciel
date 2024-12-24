import 'package:flutter/material.dart';
import 'background/animated_background.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        useBlueGradient: true, // Utilise le dégradé bleu spécifique
        child: Stack(
          children: [
            // Logo avec rotation animée qui dépasse le haut de l'écran
            Positioned(
              top: -200,
              left: 0,
              right: 0,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 158, end: 277),
                duration: const Duration(milliseconds: 800),
                builder: (context, angle, child) {
                  return Transform.rotate(
                    angle: angle * (3.141592653589793 / 180),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 400,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            // Texte principal
            const Column(
              children: [
                SizedBox(height: 250), // Décalage sous le logo
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Marre du temps qui gâche vos vacances ?",
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
                    "Choisissez la destination et la période idéale pour vos vacances avec notre fonction Météo de Voyage.",
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
                    "Découvrez quand visiter Paris pour profiter de ses beaux jours ou Bali pour éviter la saison des pluies.",
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
            // Rectangle avec le bouton
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
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
            ),
            // Flèche gauche pour revenir en arrière
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black54,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            // Flèche droite pour avancer
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                  color: Colors.black54,
                ),
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
