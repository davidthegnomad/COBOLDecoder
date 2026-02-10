import 'package:flutter/material.dart';

class ScanlineEffect extends StatelessWidget {
  final Widget child;

  const ScanlineEffect({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Colors.transparent,
                  Color(0x0500FF00),
                  Colors.transparent
                ],
                stops: const [0.0, 0.5, 1.0],
                tileMode: TileMode.repeated,
              ),
              backgroundBlendMode: BlendMode.overlay,
            ),
          ),
        ),
        IgnorePointer(
          child: CustomPaint(
            painter: _ScanlinePainter(),
            size: Size.infinite,
          ),
        ),
      ],
    );
  }
}

class _ScanlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..strokeWidth = 1;

    for (double y = 0; y < size.height; y += 4) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
