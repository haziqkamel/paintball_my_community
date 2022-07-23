import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paintball_app/main.dart';
import 'package:paintball_app/utils/app_utils.dart';
import 'package:paintball_app/utils/firebase_utils.dart';

class SignUpController extends GetxController {
  RxBool isObscure = false.obs;
  RxBool isPdpaChecked = false.obs;
  RxBool isPromotionalChecked = false.obs;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late FocusNode userNode;
  late FocusNode passwordNode;
  late FocusNode emailNode;

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    userNode = FocusNode();
    passwordNode = FocusNode();
    emailNode = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    userNode.dispose();
    passwordNode.dispose();
    emailNode.dispose();
    super.dispose();
  }

  onObscurePressed() {
    isObscure.value = !isObscure.value;
  }

  onPdpaPressed(bool isChecked) {
    isPdpaChecked.value = isChecked;
  }

  onPromotionalPressed(bool isChecked) {
    isPromotionalChecked.value = isChecked;
  }

  onSubmit() async {
    FocusScope.of(Get.context!).unfocus();

    AppUtils.showOverlayLoading();

    if (formState.currentState!.validate() && isPdpaChecked.value) {
      try {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((_) async {
          User? user = FirebaseUtils.firebaseUser;
          await user?.updateDisplayName(usernameController.text.trim());
        });
        print(userCredential.toString());
      } on FirebaseAuthException catch (e) {
        AppUtils.showSnackBar(e.message.toString());
      }
    } else {
      AppUtils.showSnackBar(
          'Incomplete form. Please fill up required field and agree to Terms and Conditions and Privacy Policy');
    }
    navigatorKey.currentState!.pop();
  }
}
