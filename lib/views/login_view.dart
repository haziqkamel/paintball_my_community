import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/controllers/login_controller.dart';
import 'package:paintball_app/utils/app_utils.dart';
import 'package:paintball_app/views/sign_up_view.dart';

import '../widgets/app_logo_widget.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/label_text_widget.dart';
import '../widgets/outline_text_widget.dart';
import 'home_view.dart';

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
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeView();
            } else {
              return SafeArea(
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
                      Form(
                        key: _controller.globalKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const LabelTextWidget(
                                labelText: 'Email',
                                fontSize: 15,
                              ),
                              CustomTextFormField(
                                hintText: 'Your email',
                                controller: _controller.controllerEmail,
                                focusNode: _controller.usernameFocus,
                                onFieldSubmitted: (txt) =>
                                    AppUtils.changeFocusNode(
                                  context: context,
                                  node: _controller.passwordFocus,
                                ),
                                validator: (val) => AppUtils.emailValidator(
                                    val, _controller.controllerEmail),
                              ),
                              const SizedBox(height: 15),
                              const LabelTextWidget(
                                labelText: 'Password',
                                fontSize: 15,
                              ),
                              Obx(
                                () => CustomTextFormField(
                                  controller: _controller.controllerPassword,
                                  hintText: 'Your password',
                                  focusNode: _controller.passwordFocus,
                                  textObscure: !_controller.isObscure.value,
                                  validator: (val) =>
                                      AppUtils.passwordValidator(
                                          val, _controller.controllerPassword),
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
                              buildForgotPassword(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => _controller.onSubmit(),
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
                              buildLoginWithSocialMedia(),
                              buildDontHaveAccount()
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildForgotPassword() {
    return Align(
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
    );
  }

  Widget buildDontHaveAccount() {
    return InkWell(
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
    );
  }

  Widget buildLoginWithSocialMedia() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Or Continue With',
            style: GoogleFonts.dmSans(fontSize: 15, color: yellow),
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
                if (Platform.isIOS)
                  buildLoginIcon('assets/logo/apple_logo3x.png'),
              ],
            ),
          ),
        ),
      ],
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
