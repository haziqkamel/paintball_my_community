import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt menuIndex = 0.obs;
  RxInt sideMenuIndex = 0.obs;

  onMenuIndexPressed(int index) {
    menuIndex.value = index;
  }

  onSideMenuIndexPressed(int index) {
    sideMenuIndex.value = index;
  }
}
