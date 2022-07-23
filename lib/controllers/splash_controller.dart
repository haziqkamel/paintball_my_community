import 'package:get/get.dart';
import 'package:paintball_app/routes/route_path.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await delay();
    super.onInit();
  }

  Future<void> delay() async {
    await Future.delayed(const Duration(seconds: 2))
        .then((_) => Get.offAndToNamed(LOGIN));
  }
}
