import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/routes/route_generator.dart';
import 'package:paintball_app/routes/route_path.dart';

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
      initialRoute: SPLASHSCREEN,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
