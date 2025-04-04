import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../widgets/hover_effect.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    // Group skills by category
    final Map<String, List<Skill>> categorizedSkills = {};

    for (final skill in skills) {
      if (!categorizedSkills.containsKey(skill.category)) {
        categorizedSkills[skill.category] = [];
      }
      categorizedSkills[skill.category]!.add(skill);
    }

    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final category in categorizedSkills.keys)
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SkillCategory(
              category: category,
              skills: categorizedSkills[category]!,
              isSmallScreen: isSmallScreen,
            ),
          ),
      ],
    );
  }
}

class SkillCategory extends StatelessWidget {
  final String category;
  final List<Skill> skills;
  final bool isSmallScreen;

  const SkillCategory({
    super.key,
    required this.category,
    required this.skills,
    this.isSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 16),
        isSmallScreen
            ? _buildMobileSkillsList(context)
            : _buildDesktopSkillsList(context),
      ],
    );
  }

  Widget _buildMobileSkillsList(BuildContext context) {
    return Column(
      children: [
        for (final skill in skills)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SkillItem(skill: skill),
          ),
      ],
    );
  }

  Widget _buildDesktopSkillsList(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        for (final skill in skills)
          SizedBox(width: 200, child: SkillItem(skill: skill)),
      ],
    );
  }
}

class SkillItem extends StatefulWidget {
  final Skill skill;

  const SkillItem({super.key, required this.skill});

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.skill.proficiency,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // Delay animation start
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverEffect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.skill.name,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                return _buildProgressBar(_progressAnimation.value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(double value) {
    return Container(
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
