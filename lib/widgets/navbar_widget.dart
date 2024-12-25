import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          _buildNavBarItem(
              Icons.home, "Accueil", 0, const Color(0xFF2D4379)), // Gris foncé
          _buildNavBarItem(Icons.wb_sunny, "Météo classique", 1,
              const Color(0xFFFFD700)), // Jaune foncé
          _buildNavBarItem(Icons.flight_takeoff, "Météo voyage", 2,
              const Color(0xFF69BFFF)), // Bleu foncé
          _buildNavBarItem(Icons.local_florist, "Météo plantes", 3,
              const Color(0xFF4CAF50)), // Vert foncé
        ],
      ),
    );
  }

  Widget _buildNavBarItem(
      IconData icon, String label, int index, Color activeColor) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 28,
            color:
                selectedIndex == index ? activeColor : const Color(0xFFB0C6DE),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selectedIndex == index
                  ? activeColor
                  : const Color(0xFFB0C6DE),
            ),
          ),
        ],
      ),
    );
  }
}
