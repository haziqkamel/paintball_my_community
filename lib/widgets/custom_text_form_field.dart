import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.textObscure = false,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool textObscure;
  final FocusNode? focusNode;
  final Function(String?)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      validator: validator,
      obscureText: textObscure,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(color: yellow.withOpacity(0.5), fontSize: 15),
        focusedBorder: yellowDecoration,
        focusedErrorBorder: yellowDecoration,
        border: yellowDecoration,
        errorBorder: yellowDecoration,
        disabledBorder: yellowDecoration,
        enabledBorder: yellowDecoration,
      ),
    );
  }
}
