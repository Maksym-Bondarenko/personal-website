import 'package:flutter/material.dart';

class SectionContainer extends StatefulWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool isLastSection;
  final GlobalKey? sectionKey;

  const SectionContainer({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    this.isLastSection = false,
    this.sectionKey,
  });

  @override
  State<SectionContainer> createState() => _SectionContainerState();
}

class _SectionContainerState extends State<SectionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.sectionKey, // ✅ Attach key here
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          widget.child,
          if (!widget.isLastSection) _buildDivider(),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Container(
        height: 1,
        color: Theme.of(context).dividerColor.withOpacity(0.1),
      ),
    );
  }
}
