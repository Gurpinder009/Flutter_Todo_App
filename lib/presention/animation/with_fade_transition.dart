import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';

withFadeTransition({required Widget child}) {
  return CustomTransitionPage(
      child: child,
      transitionsBuilder:
          (BuildContext context, animation, nextAnimation, child) {
        return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child);
      });
}
