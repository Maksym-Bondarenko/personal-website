import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../models/portfolio_data.dart';
import '../../widgets/hover_effect.dart';

class HomeSection extends StatefulWidget {
  final PortfolioData data;

  const HomeSection({super.key, required this.data});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    // Delay the start of the animation slightly
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 800;

    return FadeTransition(
      opacity: _fadeInAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child:
            isSmallScreen
                ? _buildMobileLayout(context)
                : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: _buildProfileImage()),
        const SizedBox(width: 48),
        Expanded(flex: 2, child: _buildIntroContent(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileImage(),
        const SizedBox(height: 32),
        _buildIntroContent(context),
      ],
    );
  }

  Widget _buildProfileImage() {
    // If user hasn't provided a local asset path, show a placeholder.
    final imagePath = widget.data.profileImageUrl;
    if (imagePath == null || imagePath.isEmpty) {
      // fallback if no image is set
      return const FlutterLogo(size: 120);
    }

    return HoverEffect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
          image: DecorationImage(
            // Use AssetImage(...) for local asset images
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildIntroContent(BuildContext context) {
    final socialLinks = widget.data.socialLinks;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        // Typing animation for name
        AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TypewriterAnimatedText(
              widget.data.name,
              textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              speed: const Duration(milliseconds: 80),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Typing animation for title
        AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TypewriterAnimatedText(
              widget.data.title,
              textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
              speed: const Duration(milliseconds: 60),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.data.about.replaceAll(
              '**',
              '',
            ), // Optional: remove markdown formatting
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
              color: Colors.greenAccent,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Social Media Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // GITHUB
            if (socialLinks.containsKey('github'))
              _buildSocialIcon(
                icon: FontAwesomeIcons.github,
                onTap: () => _launchUrl(socialLinks['github']!),
                tooltip: 'GitHub',
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black87,
              ),

            // LINKEDIN
            if (socialLinks.containsKey('linkedin'))
              _buildSocialIcon(
                icon: FontAwesomeIcons.linkedinIn,
                onTap: () => _launchUrl(socialLinks['linkedin']!),
                tooltip: 'LinkedIn',
                color: const Color(0xFF0077B5),
              ),

            // SCHOLAR
            if (socialLinks.containsKey('scholar'))
              _buildSocialIcon(
                // no official brand icon in FontAwesome for Scholar,
                // so we keep Icons.school or you can import a custom PNG
                icon: Icons.school,
                onTap: () => _launchUrl(socialLinks['scholar']!),
                tooltip: 'Google Scholar',
                color: const Color(0xFF4285F4),
              ),

            // EMAIL
            if (widget.data.email.isNotEmpty)
              _buildSocialIcon(
                // using FontAwesome envelope
                icon: FontAwesomeIcons.solidEnvelope,
                onTap: () => _launchUrl('mailto:${widget.data.email}'),
                tooltip: 'Email',
                color: const Color(0xFFEA4335),
              ),

            const SizedBox(width: 16),

            // DOWNLOAD RESUME (if resumeUrl is provided)
            if (widget.data.resumeUrl != null &&
                widget.data.resumeUrl!.isNotEmpty)
              HoverEffect(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  final url =
                      Uri.base.resolve(widget.data.resumeUrl!).toString();
                  launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.download,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Download Resume',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required VoidCallback onTap,
    required String tooltip,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: HoverEffect(
        onTap: onTap,
        child: Tooltip(
          message: tooltip,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: color ?? Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open $url')));
    }
  }
}
