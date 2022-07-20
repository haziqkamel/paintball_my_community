import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/controllers/login_controller.dart';
import 'package:paintball_app/views/home_view.dart';
import 'package:paintball_app/views/sign_up_view.dart';

import '../widgets/app_logo_widget.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/label_text_widget.dart';
import '../widgets/outline_text_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        backgroundColor: black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppLogoWidget(),
                const Spacer(),
                const OutlineTextWidget(
                  text: 'LOGIN',
                  fontSize: 25,
                  color: yellow,
                ),
                const Divider(
                  thickness: 1,
                  color: yellow,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelTextWidget(
                        labelText: 'Username',
                        fontSize: 15,
                      ),
                      const CustomTextFormField(
                        hintText: 'Your username',
                      ),
                      const SizedBox(height: 15),
                      const LabelTextWidget(
                        labelText: 'Password',
                        fontSize: 15,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          hintText: 'Your password',
                          textObscure: !_controller.isObscure.value,
                          suffixIcon: Obx(
                            () => IconButton(
                              onPressed: _controller.onObscurePressed,
                              icon: Icon(
                                _controller.isObscure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: yellow,
                              ),
                              color: yellow,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 11),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: null,
                          child: Text(
                            'Forgot Password ?',
                            style: GoogleFonts.dmSans(
                              fontSize: 15,
                              color: yellow.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => HomeView()),
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            child: Text(
                              'Log In',
                              style: GoogleFonts.dmSans(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Or Continue With',
                          style:
                              GoogleFonts.dmSans(fontSize: 15, color: yellow),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildLoginIcon('assets/logo/fb_logo3x.png'),
                              buildLoginIcon('assets/logo/google_logo3x.png'),
                              buildLoginIcon('assets/logo/apple_logo3x.png'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(() => SignUpView()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have account? ',
                              style: GoogleFonts.dmSans(
                                color: yellow,
                                fontSize: 15,
                              ),
                            ),
                            Text('Sign-Up Here',
                                style: GoogleFonts.dmSans(
                                    color: yellow,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginIcon(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 71,
        width: 71,
        child: Image.asset(imagePath),
      ),
    );
  }
}
