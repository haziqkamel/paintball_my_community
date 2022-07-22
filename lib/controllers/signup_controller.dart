import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paintball_app/utils/app_utils.dart';

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

  onSubmit() {
    FocusScope.of(Get.context!).unfocus();
    if (formState.currentState!.validate() && isPdpaChecked.value) {
      print('Okay to navigate!');
      //TODO: Firebase Authentication
    } else if (!isPdpaChecked.value) {
      Get.defaultDialog(
        title: 'Required!',
        contentPadding: const EdgeInsets.all(8),
        content: const Text(
          'Please accept the Privacy Policy to continue.',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      AppUtils.showSnackBar('Invalid Form');
    }
  }
}
