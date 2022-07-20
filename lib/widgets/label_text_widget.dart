import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color.dart';

class LabelTextWidget extends StatelessWidget {
  const LabelTextWidget({
    Key? key,
    required this.labelText,
    required this.fontSize,
  }) : super(key: key);

  final String labelText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        labelText,
        style: GoogleFonts.dmSans(color: yellow, fontSize: fontSize),
      ),
    );
  }
}
