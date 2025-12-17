import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_theme.dart';
import '../../data/project_data.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: (){
          context.go('/project/${widget.project.id}');
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..translate(0, _isHovered ? -10.0 : 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(24), // Reduced padding slightly to save space
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.08),
                      Colors.white.withOpacity(0.03),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _isHovered
                        ? AppTheme.primaryColor.withOpacity(0.5)
                        : Colors.white.withOpacity(0.1),
                    width: 1.5,
                  ),
                  boxShadow: _isHovered
                      ? [BoxShadow(color: AppTheme.primaryColor.withOpacity(0.15), blurRadius: 30, offset: const Offset(0, 10))]
                      : [],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.folder_open_rounded, color: AppTheme.primaryColor, size: 36),
                        if (widget.project.link != null)
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github, size: 22),
                            onPressed: () => launchUrl(Uri.parse(widget.project.link!)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // 2. Title
                    Text(
                      widget.project.title,
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 10),

                    // 3. Description (FIXED: Added Expanded + maxLines)
                    Expanded(
                      child: Text(
                        widget.project.description,
                        style: GoogleFonts.inter(
                            color: Colors.white70,
                            height: 1.5,
                            fontSize: 14
                        ),
                        maxLines: 4, // Limit lines to prevent overflow
                        overflow: TextOverflow.ellipsis, // Add ... if too long
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 4. Tags
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags.map((t) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                            t,
                            style: GoogleFonts.jetBrainsMono(
                                color: AppTheme.primaryColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500
                            )
                        ),
                      )).toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}