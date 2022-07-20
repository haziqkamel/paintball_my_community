import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool isObscure = false.obs;
  RxBool isPdpaChecked = false.obs;
  RxBool isPromotionalChecked = false.obs;

  onObscurePressed() {
    isObscure.value = !isObscure.value;
  }

  onPdpaPressed(bool isChecked) {
    isPdpaChecked.value = isChecked;
  }

  onPromotionalPressed(bool isChecked) {
    isPromotionalChecked.value = isChecked;
  }
}
