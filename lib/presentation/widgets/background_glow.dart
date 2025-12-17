import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundGlow extends StatelessWidget {
  const BackgroundGlow({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen size for positioning
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Top Left Blob (Cyan/Primary)
        Positioned(
          top: -100,
          left: -100,
          child: _buildBlob(
              color: const Color(0xFF64FFDA).withOpacity(0.2),
              size: 500
          ),
        ),
        // Center Right Blob (Purple/Secondary)
        Positioned(
          top: size.height * 0.3,
          right: -50,
          child: _buildBlob(
              color: const Color(0xFFBD34FE).withOpacity(0.15),
              size: 400
          ),
        ),
        // Bottom Left Blob (Blue)
        Positioned(
          bottom: -100,
          left: size.width * 0.2,
          child: _buildBlob(
              color: const Color(0xFF1E88E5).withOpacity(0.15),
              size: 600
          ),
        ),
      ],
    );
  }

  Widget _buildBlob({required Color color, required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: BackdropFilter(
        // High sigma creates the smooth "mesh gradient" look
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}