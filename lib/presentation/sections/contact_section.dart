import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              // 1. The Avatar Photo
              const _ContactAvatar(),

              const SizedBox(height: 40),

              const Text(
                "Get In Touch",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                "I'm currently looking for any new opportunities, my inbox is always open. I'll try my best to get back to you!",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 18, height: 1.5),
              ),

              const SizedBox(height: 50),

              // 3. Social Icons Row
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _SocialButton(
                    icon: Icons.email_outlined,
                    onPressed: () => _launchURL(Uri.parse("mailto:kalerharman105@gmail.com")),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.linkedinIn,
                    onPressed: () => _launchURL(Uri.parse("https://www.linkedin.com/in/harman-kaler-57575b27a/")),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.xTwitter,
                    onPressed: () => _launchURL(Uri.parse("https://x.com/Harman__Kaler")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
class _SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialButton({required this.icon, required this.onPressed});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IconButton(
        onPressed: widget.onPressed,
        iconSize: 28,
        style: IconButton.styleFrom(
          foregroundColor: _isHovered ? AppTheme.primaryColor : AppTheme.textSecondary,
          side: BorderSide(
              color: _isHovered ? AppTheme.primaryColor : Colors.white12,
              width: 1.5
          ),
          padding: const EdgeInsets.all(16),
        ),
        icon: FaIcon(widget.icon),
      ).animate(target: _isHovered ? 1 : 0).scale(end: const Offset(1.1, 1.1)),
    );
  }
}

class _ContactAvatar extends StatelessWidget {
  const _ContactAvatar();

  @override
  Widget build(BuildContext context) {
    double size = Responsive.isMobile(context) ? 100 : 140;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: AppTheme.primaryColor, width: 2),
      ),
      child: ClipOval(
        child: Image.asset(
          "assets/profile.jpg",
          fit: BoxFit.cover,
          width: size,
          height: size,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppTheme.surfaceColor,
              child: const Center(
                child: Icon(Icons.person, size: 50, color: Colors.white24),
              ),
            );
          },
        ),
      ),
    ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack);
  }
}