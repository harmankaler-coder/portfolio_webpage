import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../data/project_data.dart';
import '../widgets/background_glow.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Glow (Consistent with Home)
          const Positioned.fill(child: BackgroundGlow()),

          // 2. Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                _buildContent(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor.withOpacity(0.5),
        border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back Button
          IconButton(
            onPressed: () => context.go('/'), // GoRouter back to home
            icon: const Icon(Icons.arrow_back, color: AppTheme.primaryColor),
          ),
          const SizedBox(height: 20),

          // Title
          Text(
            project.title,
            style: GoogleFonts.inter(
              fontSize: Responsive.isMobile(context) ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn().slideY(begin: 0.2),

          const SizedBox(height: 20),

          // Tech Stack Chips
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: project.tags.map((tag) => Chip(
              label: Text(tag, style: GoogleFonts.jetBrainsMono(fontSize: 12)),
              backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
              side: BorderSide(color: AppTheme.primaryColor.withOpacity(0.5)),
              labelStyle: const TextStyle(color: AppTheme.primaryColor),
            )).toList(),
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Description
            Text(
              "About the Project",
              style: GoogleFonts.inter(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white
              ),
            ),
            const SizedBox(height: 20),
            Text(
              project.fullDescription,
              style: GoogleFonts.inter(
                  fontSize: 18,
                  height: 1.8,
                  color: AppTheme.textSecondary
              ),
            ),

            const SizedBox(height: 50),

            // Links Section
            if (project.link != null) ...[
              OutlinedButton.icon(
                onPressed: () => launchUrl(Uri.parse(project.link!)),
                icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                label: const Text("View Source Code"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  side: const BorderSide(color: AppTheme.primaryColor),
                  foregroundColor: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 50),
            ],


          ],
        ),
      ),
    );
  }
}