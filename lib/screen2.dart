import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE7F3FF), // Fond bleu clair
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 81.85 * (3.141592653589793 / 180), // Rotation en radians
              child: Image.asset('assets/logo.png', width: 150),
            ),
            const SizedBox(height: 20),
            const Text(
              "Marre du temps qui gâche vos vacances ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Choisissez la destination et la période idéale pour vos vacances avec notre fonction Météo de Voyage.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Découvrez quand visiter Paris pour profiter de ses beaux jours ou Bali pour éviter la saison des pluies.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF69BFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text("Explorer →"),
            ),
          ],
        ),
      ),
    );
  }
}
