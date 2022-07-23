import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color.dart';

class LeftTextMenu extends StatelessWidget {
  const LeftTextMenu({
    Key? key,
    required this.title,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            color: isSelected ? yellow : Colors.grey,
            decoration: isSelected ? TextDecoration.underline : null,
            fontSize: 15),
      ),
    );
  }
}
