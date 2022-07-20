import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Paintball Malaysia Community',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: yellowMaterialColor,
      ),
      home: LoginView(),
    );
  }
}
