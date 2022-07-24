import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:paintball_app/main.dart';
import 'package:paintball_app/utils/app_utils.dart';
import 'package:paintball_app/utils/firebase_authentication.dart';

class LoginController extends GetxController {
  RxBool isObscure = false.obs;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  onObscurePressed() {
    isObscure.value = !isObscure.value;
  }

  void onSubmit() async {
    AppUtils.showOverlayLoading();

    if (globalKey.currentState!.validate()) {
      try {
        await FirebaseAuthentication.signIn(
            email: controllerEmail.text, password: controllerPassword.text);
      } on FirebaseAuthException catch (e) {
        print('FirebaseAuthException: $e');
        AppUtils.showSnackBar(e.message.toString());
      }
    } else {
      AppUtils.showSnackBar('Invalid form!');
    }

    controllerEmail.clear();
    controllerPassword.clear();

    navigatorKey.currentState!.pop();
  }
}
