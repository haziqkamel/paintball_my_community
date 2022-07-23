import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    _controller.onInit();
    return Scaffold(
      body: buildSplashScreen()
    );
  }

  Widget buildSplashScreen() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/app_logo.png'),
            const SizedBox(height: 25),
            const CircularProgressIndicator(
              strokeWidth: 3,
              color: yellow,
            )
          ],
        ),
      ),
    );
  }
}
