import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintball_app/constants/color.dart';

class LoadingTypeWriter extends StatelessWidget {
  const LoadingTypeWriter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        style: GoogleFonts.russoOne(fontSize: 25, color: yellow),
        child: AnimatedTextKit(
          animatedTexts: [TypewriterAnimatedText('Loading...')],
        ),
      ),
    );
  }
}
