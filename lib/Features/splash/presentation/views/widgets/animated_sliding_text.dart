import 'package:flutter/material.dart';

class AnimatedSlidingText extends StatelessWidget {
  const AnimatedSlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            "Free book for reading",
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
