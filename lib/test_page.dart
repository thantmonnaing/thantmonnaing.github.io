import 'dart:math' show pi;

import 'package:flutter/material.dart';

class ImageTransitionPage extends StatefulWidget {
  const ImageTransitionPage({super.key});

  @override
  _ImageTransitionPageState createState() => _ImageTransitionPageState();
}

enum CircleSide { left, right }

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }

    path.close();
    return path;
  }
}

class _ImageTransitionPageState extends State<ImageTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _counterClockwiseRotationController;
  late Animation<double> _counterClockwiseRotationAnimation;

  @override
  void initState() {
    _counterClockwiseRotationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)
    );

    _counterClockwiseRotationAnimation = Tween<double>(
        begin: 0,
        end: -(pi / 2)
    ).animate(CurvedAnimation(parent: _counterClockwiseRotationController, curve: Curves.bounceIn));
    super.initState();

  }

  @override
  void dispose() {
    _counterClockwiseRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counterClockwiseRotationController
      ..reset()
      ..forward();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      height: 300,
      child: AnimatedBuilder(
        animation: _counterClockwiseRotationController,
        builder: (context,child) {
          return Transform(
            transform: Matrix4.identity()..rotateZ(_counterClockwiseRotationAnimation.value),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
