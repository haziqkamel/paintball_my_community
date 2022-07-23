import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/routes/route_generator.dart';
import 'package:paintball_app/routes/route_path.dart';
import 'package:paintball_app/utils/firebase_utils.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FirebaseUtils.init();
    FirebaseUtils
        .signOut(); //TODO: Automatically signout user each time restart as there is no signout function yet
    runApp(const MyApp());
  }, (error, stack) {
    print(error);
    print(stack);
  });
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
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
