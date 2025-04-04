import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../widgets/hover_effect.dart';

class ContactSection extends StatelessWidget {
  final PortfolioData data;

  const ContactSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in touch with me',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        isSmallScreen
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildContactInfo(context)),
        const SizedBox(width: 32),
        Expanded(child: _buildSocialLinks(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactInfo(context),
        const SizedBox(height: 32),
        _buildSocialLinks(context),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactItem(
          context,
          Icons.email,
          'Email',
          data.email,
          onTap: () => _launchUrl('mailto:${data.email}'),
          onCopy: () => _copyToClipboard(context, data.email),
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          context,
          Icons.phone,
          'Phone',
          data.phone,
          onTap: () => _launchUrl('tel:${data.phone}'),
          onCopy: () => _copyToClipboard(context, data.phone),
        ),
      ],
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    VoidCallback? onTap,
    VoidCallback? onCopy,
  }) {
    return HoverEffect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(value, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (onTap != null)
                  IconButton(
                    icon: Icon(
                      label == 'Email'
                          ? Icons.mail_outline
                          : Icons.phone_enabled,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: onTap,
                    tooltip: label == 'Email' ? 'Send Email' : 'Call',
                  ),
                if (onCopy != null)
                  IconButton(
                    icon: Icon(
                      Icons.copy,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: onCopy,
                    tooltip: 'Copy to Clipboard',
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    final socialLinks = data.socialLinks;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find me on',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            if (socialLinks.containsKey('github'))
              _buildSocialButton(
                context,
                'GitHub',
                Icons.code,
                socialLinks['github']!,
                Colors.black87,
              ),
            if (socialLinks.containsKey('linkedin'))
              _buildSocialButton(
                context,
                'LinkedIn',
                Icons.business,
                socialLinks['linkedin']!,
                const Color(0xFF0077B5),
              ),
            if (socialLinks.containsKey('scholar'))
              _buildSocialButton(
                context,
                'Google Scholar',
                Icons.school,
                socialLinks['scholar']!,
                const Color(0xFF4285F4),
              ),
            // Add more social links as needed
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String name,
    IconData icon,
    String url,
    Color color,
  ) {
    return HoverEffect(
      borderRadius: BorderRadius.circular(16),
      onTap: () => _launchUrl(url),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? color.withOpacity(0.9)
                      : color,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              name,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('Could not launch $url');
    }
  }

  Future<void> _copyToClipboard(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
