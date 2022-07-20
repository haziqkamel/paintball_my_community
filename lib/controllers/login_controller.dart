import 'package:get/get.dart';

class LoginController extends GetxController {

  RxBool isObscure = false.obs;

  onObscurePressed() {
    isObscure.value = !isObscure.value;
  }

}