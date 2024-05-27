import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({required this.child, required this.delay, super.key});
  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final tween = MovieTween()
      ..tween('translateY', Tween(begin: size.height, end: 0.0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut)
          .thenTween('opacity', Tween(begin: 0.2, end: 1.0),
              duration: const Duration(milliseconds: 500));

    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (600 * delay).round()),
      duration: tween.duration,
      tween: tween,
      builder: (BuildContext context, Movie value, Widget? child) {
        return Opacity(
            opacity: value.get('opacity'),
            child: Transform.translate(
              offset: Offset(0, value.get('translateY')),
              child: child,
            ));
      },
      child: child,
    );
  }
}
