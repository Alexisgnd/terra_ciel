import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final bool useOrangeGradient;
  final bool useBlueGradient;
  final bool useGreenGradient;

  const AnimatedBackground({
    super.key,
    required this.child,
    this.useOrangeGradient = false,
    this.useBlueGradient = false,
    this.useGreenGradient = false,
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

    // Dégradés utilisés (orange, bleu, vert ou mixte selon les paramètres)
    if (widget.useOrangeGradient) {
      _gradients = [
        [const Color(0xFFFFF4E1), const Color(0xFFFFC19D)], // Dégradé orangé
        [const Color(0xFFFFC19D), const Color(0xFFFFE4C1)],
      ];
    } else if (widget.useBlueGradient) {
      _gradients = [
        [const Color(0xFFE7F3FF), const Color(0xFF69BFFF)], // Dégradé bleu
        [const Color(0xFF69BFFF), const Color(0xFFA0B9FF)],
      ];
    } else if (widget.useGreenGradient) {
      _gradients = [
        [const Color(0xFFB4FFA0), const Color(0xFF69FFB4)], // Dégradé vert
        [const Color(0xFF69FFB4), const Color(0xFFB4FFA0)],
      ];
    } else {
      _gradients = [
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
    }

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
