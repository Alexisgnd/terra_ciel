import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  // Liste des dégradés pastels pour l'animation
  final List<List<Color>> _gradients = [
    [
      const Color(0xFFA8DADC),
      const Color(0xFFBDE0FE),
      const Color(0xFFFFC8A2)
    ], // Bleu pastel -> Vert pastel -> Orange pastel
    [
      const Color(0xFFBDE0FE),
      const Color(0xFFFFC8A2),
      const Color(0xFFA8DADC)
    ], // Rotation des couleurs
    [
      const Color(0xFFFFC8A2),
      const Color(0xFFA8DADC),
      const Color(0xFFBDE0FE)
    ], // Autre combinaison
  ];

  int _currentGradientIndex = 0; // Index du dégradé actuel

  @override
  void initState() {
    super.initState();
    // Démarre le timer pour animer les dégradés
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentGradientIndex = (_currentGradientIndex + 1) % _gradients.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3), // Durée de transition
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _gradients[_currentGradientIndex], // Dégradé actuel
        ),
      ),
      child: widget.child, // Contenu placé par-dessus le background
    );
  }
}
