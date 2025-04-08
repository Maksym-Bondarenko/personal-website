import 'package:flutter/material.dart';
import 'dart:math';

class MouseGlowEffect extends StatefulWidget {
  final Widget child;
  const MouseGlowEffect({super.key, required this.child});

  @override
  State<MouseGlowEffect> createState() => _MouseGlowEffectState();
}

class _MouseGlowEffectState extends State<MouseGlowEffect>
    with SingleTickerProviderStateMixin {
  Offset _mousePosition = Offset.zero;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      onHover: (event) {
        setState(() => _mousePosition = event.localPosition);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: _GlowPainter(
                  _mousePosition,
                  _animation.value,
                  Theme.of(context).colorScheme.primary,
                ),
              );
            },
          ),
          Positioned.fill(child: widget.child),
        ],
      ),
    );
  }
}

class _GlowPainter extends CustomPainter {
  final Offset position;
  final double animationValue;
  final Color primaryColor;

  _GlowPainter(this.position, this.animationValue, this.primaryColor);

  @override
  void paint(Canvas canvas, Size size) {
    // Main glow
    final mainGlow =
        Paint()
          ..shader = RadialGradient(
            colors: [
              primaryColor.withOpacity(0.3),
              primaryColor.withOpacity(0.1),
              Colors.transparent,
            ],
            stops: const [0.0, 0.5, 1.0],
          ).createShader(Rect.fromCircle(center: position, radius: 120));

    canvas.drawCircle(position, 120, mainGlow);

    // Sparkle effect
    final sparkleCount = 8;
    for (var i = 0; i < sparkleCount; i++) {
      final angle = (i / sparkleCount) * 2 * 3.14159;
      final distance = 60 + 20 * (animationValue * 2 - 1).abs();
      final sparklePosition = Offset(
        position.dx + distance * cos(angle),
        position.dy + distance * sin(angle),
      );

      final sparkleGlow =
          Paint()
            ..shader = RadialGradient(
              colors: [
                primaryColor.withOpacity(0.4),
                primaryColor.withOpacity(0.1),
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
            ).createShader(
              Rect.fromCircle(center: sparklePosition, radius: 30),
            );

      canvas.drawCircle(sparklePosition, 30, sparkleGlow);
    }
  }

  @override
  bool shouldRepaint(covariant _GlowPainter oldDelegate) {
    return oldDelegate.position != position ||
        oldDelegate.animationValue != animationValue ||
        oldDelegate.primaryColor != primaryColor;
  }
}
