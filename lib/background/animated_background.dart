import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final bool
      useOrangeGradient; // Ajout pour Screen1 (true = dégradé orangé uniquement)

  const AnimatedBackground({
    super.key,
    required this.child,
    this.useOrangeGradient = false, // Par défaut, mélange des trois couleurs
  });

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  late List<List<Color>> _gradients;
  int _currentGradientIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Dégradés utilisés (orange ou mixte selon `useOrangeGradient`)
    _gradients = widget.useOrangeGradient
        ? [
            [
              const Color(0xFFFFF4E1),
              const Color(0xFFFFC19D)
            ], // Dégradé orangé
            [const Color(0xFFFFC19D), const Color(0xFFFFE4C1)],
          ]
        : [
            [
              const Color(0xFFB4FFA0),
              const Color(0xFFA3CBFF),
              const Color(0xFFFFC19D)
            ], // Vert, bleu, orange
            [
              const Color(0xFFA3CBFF),
              const Color(0xFFFFC19D),
              const Color(0xFFB4FFA0)
            ], // Bleu, orange, vert
            [
              const Color(0xFFFFC19D),
              const Color(0xFFB4FFA0),
              const Color(0xFFA3CBFF)
            ], // Orange, vert, bleu
          ];

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _currentGradientIndex =
              (_currentGradientIndex + 1) % _gradients.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _gradients[_currentGradientIndex],
        ),
      ),
      child: widget.child,
    );
  }
}
