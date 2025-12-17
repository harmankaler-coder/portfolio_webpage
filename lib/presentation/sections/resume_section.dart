import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_theme.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [


              // The Content Card
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Want More Info ?",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Check out my resume for a detailed look at my experience, education, and technical skills.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppTheme.textSecondary,
                          height: 1.6
                      ),
                    ),
                    const SizedBox(height: 30),

                    // View Resume Button
                    ElevatedButton.icon(
                      onPressed: () => _launchResume(),
                      icon: const Icon(Icons.description_outlined),
                      label: const Text("View Resume"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: AppTheme.backgroundColor,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        textStyle: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),
              // Divider Line
              const SizedBox(height: 60),
              Container(
                width: 100,
                height: 2,
                color: AppTheme.primaryColor.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchResume() async {
    // REPLACE THIS STRING WITH YOUR GOOGLE DRIVE LINK
    // Ensure the Drive link is set to "Anyone with the link can view"
    const String resumeLink = "https://drive.google.com/file/d/1PEFRb-NBG8QMGeV8iZf7MoxmldDdJloI/view?usp=sharing";

    final Uri url = Uri.parse(resumeLink);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}