import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;
  final double scrollPosition;
  final double maxScrollExtent;

  const AnimatedGradientBackground({
    super.key,
    required this.child,
    required this.scrollPosition,
    required this.maxScrollExtent,
  });

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _gradientPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat(reverse: true);
    _controller.addListener(() {
      setState(() {}); // Rebuild to update the gradient animation
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedGradientBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.maxScrollExtent > 0) {
      _gradientPosition = widget.scrollPosition / widget.maxScrollExtent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final gradientColors =
        themeProvider.isDarkMode
            ? const [Color(0xFF1A237E), Color(0xFF0D47A1), Color(0xFF1B5E20)]
            : const [Color(0xFFE0F7FA), Color(0xFFE1F5FE), Color(0xFFE8F5E9)];

    // Calculate the gradient transformation based on scroll position
    final scrollFactor =
        widget.maxScrollExtent > 0
            ? widget.scrollPosition / widget.maxScrollExtent
            : 0.0;

    // Combine animation and scroll position for the gradient effect
    final animationValue = _controller.value;
    final combinedFactor = (animationValue * 0.3) + (scrollFactor * 0.7);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
          stops: [
            0.0,
            0.3 + (combinedFactor * 0.2),
            0.6 + (combinedFactor * 0.4),
          ],
          transform: GradientRotation(combinedFactor * 2 * 3.14159),
        ),
      ),
      child: widget.child,
    );
  }
}
