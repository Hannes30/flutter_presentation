import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'dart:math' show pi;

class GlassCard extends StatelessWidget {
  final Widget child;

  const GlassCard({
    Key? key,
    required this.child,
    required this.headFont,
    required this.regularFont,
  }) : super(key: key);

  final TextStyle headFont;
  final TextStyle regularFont;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.white.withOpacity(.32),
                Color.fromARGB(
                  (255 * .1).round(),
                  167,
                  210,
                  255,
                ),
              ],
              transform: const GradientRotation(
                (70.0 / 180 * pi),
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(.3),
                  Colors.white.withOpacity(.1)
                ],
                transform: const GradientRotation(
                  (70.0 / 180 * pi),
                ),
              ),
              width: .8,
            ),
            // boxShadow: const [
            //   BoxShadow(
            //       color: Colors.black,
            //       spreadRadius: .5,
            //       blurRadius: 5)
            // ],
          ),
          child: child,
        ),
      ),
    );
  }
}
