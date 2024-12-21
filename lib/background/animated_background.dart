import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  final List<List<Color>> _gradients = [
    [const Color(0xFFB4FFA0), const Color(0xFFA3CBFF), const Color(0xFFFFC19D)],
    [const Color(0xFFA3CBFF), const Color(0xFFFFC19D), const Color(0xFFB4FFA0)],
    [const Color(0xFFFFC19D), const Color(0xFFB4FFA0), const Color(0xFFA3CBFF)],
  ];

  int _currentGradientIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
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
