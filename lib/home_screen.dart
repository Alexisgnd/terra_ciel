import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF), // Couleur d'arrière-plan claire
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu hamburger
                  IconButton(
                    icon: const Icon(Icons.menu,
                        size: 28, color: Color(0xFF2D4379)),
                    onPressed: () {
                      // Action pour le menu
                    },
                  ),
                  // Photo de profil ronde
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300], // Placeholder gris
                    child: const Icon(
                      Icons.person,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Section météo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D4379),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Wed, 7 Nov",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF7B8EA9),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFA8DFFF), Color(0xFFFFFF94)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Madiun",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "25°",
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Mostly Sunny",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.wb_sunny,
                          size: 72,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Section "Recent Updates"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Recent Updates",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D4379),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildUpdateCard(
                    icon: Icons.warning_amber_rounded,
                    title: "Early Warning East Java Weather",
                    description: "Update 6 Nov 2018",
                    iconColor: const Color(0xFFFFD700),
                  ),
                  const SizedBox(height: 10),
                  _buildUpdateCard(
                    icon: Icons.article_rounded,
                    title: "Juno asteroids flyby",
                    description: "The asteroid Juno will be at its brightest.",
                    iconColor: const Color(0xFF69BFFF),
                  ),
                ],
              ),
            ),

            // Barre de navigation
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavBarIcon(Icons.home, true),
                  _buildNavBarIcon(Icons.cloud, false),
                  _buildNavBarIcon(Icons.graphic_eq, false),
                  _buildNavBarIcon(Icons.article_rounded, false),
                  _buildNavBarIcon(Icons.help_outline, false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour les cartes des mises à jour récentes
  Widget _buildUpdateCard({
    required IconData icon,
    required String title,
    required String description,
    required Color iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.2),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D4379),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7B8EA9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget pour les icônes de la barre de navigation
  Widget _buildNavBarIcon(IconData icon, bool isSelected) {
    return Icon(
      icon,
      size: 28,
      color: isSelected ? const Color(0xFF69BFFF) : const Color(0xFFB0C6DE),
    );
  }
}
