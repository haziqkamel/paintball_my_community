import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color.dart';

class AppUtils {
  static showSnackBar(String text) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      backgroundColor: yellow,
      content: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  static String? usernameValidator(
      String? text, TextEditingController controller) {
    if (controller.text.isEmpty) {
      return 'Username cannot be empty';
    } else if (controller.text.contains(RegExp(r'[0-9]'))) {
      return 'Username cannot contain numbers';
    } else if (controller.text.length < 5) {
      return 'Username length should more than 5 characters';
    }
    return null;
  }

  static String? passwordValidator(
      String? text, TextEditingController controller) {
    final passwordRegex =
        RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
    if (controller.text.isEmpty) {
      return 'Password cannot be empty';
    } else if (controller.text.length < 5) {
      return 'Password length should be at least 8 characters';
    } else if (!passwordRegex.hasMatch(controller.text)) {
      return 'Password should have 1 capital letter and 1 number';
    }
    return null;
  }

  static String? emailValidator(
      String? text, TextEditingController controller) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (controller.text.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegex.hasMatch(controller.text)) {
      return 'Invalid email!';
    }
    return null;
  }

  static void changeFocusNode(
          {required BuildContext context, required FocusNode node}) =>
      FocusScope.of(context).requestFocus(node);

  static showOverlayLoading() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
