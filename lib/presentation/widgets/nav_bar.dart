import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavClick;

  const NavBar({super.key, required this.onNavClick});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          // Allow width to shrink to fit content
          width: null,
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => onNavClick("About"),
                borderRadius: BorderRadius.circular(20),
                child: Text(
                  "<Harman>",
                  style: GoogleFonts.jetBrainsMono(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
              ),

              if (!isMobile) const SizedBox(width: 30),

              // 2. DESKTOP LINKS
              if (!isMobile) ...[
                _navItem("About", () => onNavClick("About")),
                _navItem("Projects", () => onNavClick("Projects")),
                _navItem("Contact", () => onNavClick("Contact")),
              ],

              // 3. MOBILE MENU
              if (isMobile)
                Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    popupMenuTheme: PopupMenuThemeData(
                      color: AppTheme.surfaceColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  child: PopupMenuButton<String>(
                    icon: const Icon(Icons.menu, color: Colors.white, size: 20),
                    offset: const Offset(0, 45),
                    onSelected: (value) => onNavClick(value),
                    itemBuilder: (BuildContext context) {
                      return [
                        _buildPopupItem("About"),
                        _buildPopupItem("Projects"),
                        _buildPopupItem("Contact"),
                      ];
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildPopupItem(String title) {
    return PopupMenuItem<String>(
      value: title,
      child: Text(
        title,
        style: GoogleFonts.jetBrainsMono(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}