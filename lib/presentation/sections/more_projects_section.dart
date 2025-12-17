import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_theme.dart';

class MoreProjectsSection extends StatelessWidget {
  const MoreProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              "Want to see more?",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),

            // The Link Button
            InkWell(
              onTap: _launchGitHub,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.primaryColor),
                  borderRadius: BorderRadius.circular(30),
                  color: AppTheme.primaryColor.withOpacity(0.05),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FaIcon(FontAwesomeIcons.github, size: 18, color: AppTheme.primaryColor),
                    const SizedBox(width: 10),
                    Text(
                      "Visit my GitHub Profile",
                      style: GoogleFonts.jetBrainsMono(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
          ],
        ),
      ),
    );
  }

  void _launchGitHub() async {
    // Link from your resume
    final Uri url = Uri.parse("https://github.com/harmankaler-coder");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}