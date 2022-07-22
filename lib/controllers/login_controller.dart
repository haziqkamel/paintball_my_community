import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:paintball_app/routes/route_path.dart';
import 'package:paintball_app/utils/app_utils.dart';

class LoginController extends GetxController {
  RxBool isObscure = false.obs;
  late TextEditingController controllerUsername;
  late TextEditingController controllerPassword;
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    controllerUsername = TextEditingController();
    controllerPassword = TextEditingController();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerPassword.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  onObscurePressed() {
    isObscure.value = !isObscure.value;
  }

  void onSubmit() {
    if (globalKey.currentState!.validate()) {
      print('Okay!');
      //TODO: Firebase Authentication
      Get.offAndToNamed(HOME);
    } else {
      AppUtils.showSnackBar('Invalid form!');
    }
  }
}
