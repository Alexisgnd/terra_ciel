import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Bonjour !";
    } else if (hour < 18) {
      return "Bon après-midi !";
    } else {
      return "Bonsoir !";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Message de bienvenue
              Text(
                _getGreeting(),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D4379),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Voici un aperçu des fonctionnalités disponibles :",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF7B8EA9),
                ),
              ),
              const SizedBox(height: 20),

              // Aperçu des fonctionnalités
              Expanded(
                child: ListView(
                  children: [
                    _buildFeatureCard(
                      icon: Icons.wb_sunny,
                      title: "Météo classique",
                      description:
                          "Consultez les prévisions météorologiques précises pour aujourd'hui et les prochains jours.",
                      color: const Color(0xFFFFD700),
                      onTap: () {
                        // Redirection vers l'onglet Météo classique
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildFeatureCard(
                      icon: Icons.flight_takeoff,
                      title: "Météo voyage",
                      description:
                          "Planifiez vos prochaines vacances avec une météo idéale.",
                      color: const Color(0xFF69BFFF),
                      onTap: () {
                        // Redirection vers l'onglet Météo voyage
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildFeatureCard(
                      icon: Icons.local_florist,
                      title: "Météo des plantes",
                      description:
                          "Recevez des conseils pour arroser ou planter vos végétaux.",
                      color: const Color(0xFF69FFB4),
                      onTap: () {
                        // Redirection vers l'onglet Météo des plantes
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
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
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
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
      ),
    );
  }
}
