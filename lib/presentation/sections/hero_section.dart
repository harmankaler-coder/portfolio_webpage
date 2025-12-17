import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onViewWorkTap;

  const HeroSection({super.key, required this.onViewWorkTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final String _targetText = "Harman Kaler.";
  String _currentText = "";
  int _charIndex = 0;
  Timer? _typingTimer;
  Timer? _cursorTimer;
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();
    _startTyping();
    _startCursorBlink();
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  // 1. Cursor Blink Logic (Runs forever)
  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() => _showCursor = !_showCursor);
      }
    });
  }

  // 2. Typing Logic (Runs ONCE then stops)
  void _startTyping() {
    const typingSpeed = Duration(milliseconds: 100); // Adjust speed here

    _typingTimer = Timer.periodic(typingSpeed, (timer) {
      if (!mounted) return;

      setState(() {
        if (_charIndex < _targetText.length) {
          _charIndex++;
          _currentText = _targetText.substring(0, _charIndex);
        } else {
          // Finished typing? Stop the timer.
          _typingTimer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Intro Line
        Text(
          "Hi, I'm",
          style: GoogleFonts.jetBrainsMono(
            color: AppTheme.primaryColor,
            fontSize: Responsive.isMobile(context) ? 14 : 16,
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(),

        const SizedBox(height: 10),

        // TYPING ANIMATION WIDGET
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Stack(
            children: [
              // Layer A: The Outline Text (Background)
              Transform.translate(
                offset: const Offset(4, 4),
                child: Text(
                  _currentText,
                  style: GoogleFonts.inter(
                    fontSize: 90,
                    height: 0.9,
                    fontWeight: FontWeight.w900,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.white.withOpacity(0.1),
                  ),
                ),
              ),

              // Layer B: The Solid Text (Foreground)
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _currentText,
                      style: GoogleFonts.inter(
                        fontSize: 90,
                        height: 0.9,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    // The Blinking Cursor "_"
                    TextSpan(
                      text: "_",
                      style: GoogleFonts.inter(
                        fontSize: 90,
                        height: 0.9,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.primaryColor.withOpacity(_showCursor ? 1.0 : 0.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        Text(
          "I build modern mobile applications and innovate user experiences.",
          style: GoogleFonts.inter(
            fontSize: Responsive.isMobile(context) ? 28 : 50,
            fontWeight: FontWeight.w700,
            color: AppTheme.textSecondary,
          ),
        ).animate().fadeIn(delay: 1000.ms).slideY(begin: 0.2), // Waits for typing to finish

        const SizedBox(height: 30),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            "I'm a software engineer focused on building accessible, intuitive and high-quality digital experiences. I enjoy turning complex problems into elegant & scalable solutions",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Responsive.isMobile(context) ? 16 : 18,
            ),
          ),
        ).animate().fadeIn(delay: 1200.ms),

        const SizedBox(height: 50),

        OutlinedButton(
          onPressed: widget.onViewWorkTap,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            side: const BorderSide(color: AppTheme.primaryColor),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            "Check out my work!",
            style: GoogleFonts.jetBrainsMono(
              color: AppTheme.primaryColor,
              fontSize: 16,
            ),
          ),
        ).animate().fadeIn(delay: 1400.ms),
      ],
    );
  }
}