import 'package:flutter/material.dart';

class BackgroundPattern extends StatelessWidget {
  const BackgroundPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: DotGridPainter(
          color: Colors.white.withOpacity(0.1),
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class DotGridPainter extends CustomPainter {
  final Color color;
  const DotGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // If size is zero, don't paint
    if (size.width == 0 || size.height == 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const double spacing = 30.0; // Tighter spacing
    const double radius = 2.0; // Slightly larger dots

    for (double x = 0; x < size.width + spacing; x += spacing) {
      for (double y = 0; y < size.height + spacing; y += spacing) {
        double xOffset = (y ~/ spacing) % 2 == 0 ? 0 : spacing / 2;
        canvas.drawCircle(Offset(x + xOffset, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
