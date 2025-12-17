import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';
import '../sections/more_projects_section.dart';
import '../sections/resume_section.dart';
import '../widgets/background_pattern.dart';
import '../widgets/nav_bar.dart';
import '../widgets/footer.dart';
import '../widgets/background_glow.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/contact_section.dart';
import '../../core/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: BackgroundGlow()),

          const Positioned.fill(child: BackgroundPattern()),

          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isDesktop(context) ? 100.0 : 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 160),
                    HeroSection(
                      key: _heroKey,
                      onViewWorkTap: () => _scrollToSection(_projectsKey),
                    ),

                    const SizedBox(height: 150),
                    ProjectsSection(key: _projectsKey),
                    const SizedBox(height: 40),
                    const MoreProjectsSection(),
                    const SizedBox(height: 150),
                    ContactSection(key: _contactKey),
                    const ResumeSection(),
                    const SizedBox(height: 150),
                    const Footer(),

                  ],
                ),
              ),
            ),
          ),

          // 1. THE NEW PROFILE PHOTO (Top Left)
          Positioned(
            top: 25, // Aligned with NavBar
            left: 40, // 40px from Left edge
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.primaryColor.withOpacity(0.5), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/profile.jpg", // Ensure path is correct
                  fit: BoxFit.cover,
                  // Fallback if image fails
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppTheme.surfaceColor,
                    child: const Icon(Icons.person, color: Colors.white54),
                  ),
                ),
              ),
            ),
          ),

          // 2. THE NAV BAR (Top Right)
          Positioned(
            top: 20,
            right: 40,
            child: NavBar(
              onNavClick: (section) {
                if (section == "About") _scrollToSection(_heroKey);
                if (section == "Work") _scrollToSection(_projectsKey);
                if (section == "Contact") _scrollToSection(_contactKey);
              },
            ),
          ),
        ],
      ),
    );
  }
}