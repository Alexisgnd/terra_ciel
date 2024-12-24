import 'package:flutter/material.dart';

class FadeTransitionWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;

  const FadeTransitionWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildText(text1, 0),
        const SizedBox(height: 10),
        _buildText(text2, 500),
        const SizedBox(height: 10),
        _buildText(text3, 1000),
      ],
    );
  }

  Widget _buildText(String text, int delay) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: delay)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 500),
            builder: (context, double opacity, child) {
              return Opacity(opacity: opacity, child: child);
            },
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
