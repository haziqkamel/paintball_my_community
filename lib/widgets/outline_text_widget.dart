import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineTextWidget extends StatelessWidget {
  const OutlineTextWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.russoOne(
        fontSize: fontSize,
        foreground: Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0,
      ),
    );
  }
}
