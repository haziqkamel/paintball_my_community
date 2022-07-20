import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/views/login_view.dart';

void main() {
  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    print(error);
    print(stack);
  });
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
