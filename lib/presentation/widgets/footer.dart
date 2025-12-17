import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Text(
          "Designed & Built by Harman Kaler © 2025",
          style: GoogleFonts.jetBrainsMono(color: Colors.white38, fontSize: 12),
        ),
      ),
    );
  }
}