import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class HoverEffect extends StatefulWidget {
  final Widget child;
  final double elevation;
  final double hoverElevation;
  final Duration duration;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? hoverColor;
  final VoidCallback? onTap;
  final double scale;
  final double hoverScale;

  const HoverEffect({
    super.key,
    required this.child,
    this.elevation = 0,
    this.hoverElevation = 4,
    this.duration = const Duration(milliseconds: 200),
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.color,
    this.hoverColor,
    this.onTap,
    this.scale = 1.0,
    this.hoverScale = 1.03,
  });

  @override
  State<HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final hoverColor =
        widget.hoverColor ??
        (themeProvider.isDarkMode
            ? const Color(0x0DFFFFFF)
            : const Color(0x0D000000));

    return MouseRegion(
      onEnter: (event) => _onHover(true),
      onExit: (event) => _onHover(false),
      cursor:
          widget.onTap != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          transform:
              Matrix4.identity()
                ..scale(_isHovered ? widget.hoverScale : widget.scale),
          decoration: BoxDecoration(
            color:
                _isHovered
                    ? (widget.color ?? Colors.transparent).withOpacity(0.05)
                    : widget.color,
            shape: widget.shape,
            borderRadius:
                widget.shape == BoxShape.rectangle ? widget.borderRadius : null,
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    if (kIsWeb) {
      setState(() {
        _isHovered = isHovered;
      });
    }
  }
}
