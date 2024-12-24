import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  final double rotationAngle;

  const AnimatedLogo({super.key, required this.rotationAngle});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -200,
      left: 0,
      right: 0,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 800),
        tween: Tween<double>(begin: 0, end: rotationAngle),
        builder: (BuildContext context, double angle, Widget? child) {
          return Transform.rotate(
            angle: angle * (3.141592653589793 / 180),
            child: Image.asset(
              'assets/logo.png',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
