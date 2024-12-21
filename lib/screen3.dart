import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE8FBE9), // Fond vert clair
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: -38.39 * (3.141592653589793 / 180), // Rotation en radians
              child: Image.asset('assets/logo.png', width: 150),
            ),
            const SizedBox(height: 20),
            const Text(
              "Des projets verts ? La nature vous remerciera !",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Planifiez vos plantations avec soin grâce à nos recommandations basées sur la météo et vos choix de plantes.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Plantez des tomates au bon moment pour une récolte optimale.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF56C596),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text("Profiter →"),
            ),
          ],
        ),
      ),
    );
  }
}
