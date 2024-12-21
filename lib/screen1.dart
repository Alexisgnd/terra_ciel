import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF4E1), // Fond orange clair
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: -202 * (3.141592653589793 / 180), // Rotation en radians
              child: Image.asset('assets/logo.png', width: 150),
            ),
            const SizedBox(height: 20),
            const Text(
              "Faites rayonner vos sorties !",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Planifiez vos sorties en toute sérénité grâce à nos prévisions météorologiques précises et personnalisées.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Organisez vos pique-niques, sorties en famille ou escapades entre amis en toute confiance.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text("Découvrir →"),
            ),
          ],
        ),
      ),
    );
  }
}
