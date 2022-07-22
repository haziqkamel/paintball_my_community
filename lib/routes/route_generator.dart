import 'package:flutter/material.dart';
import 'package:paintball_app/routes/route_path.dart';
import 'package:paintball_app/views/home_view.dart';
import 'package:paintball_app/views/login_view.dart';
import 'package:paintball_app/views/sign_up_view.dart';
import 'package:paintball_app/views/splashscreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASHSCREEN:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: const RouteSettings(name: SPLASHSCREEN),
        );

      case HOME:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
          settings: const RouteSettings(name: HOME),
        );

      case SIGNUP:
        return MaterialPageRoute(
          builder: (_) => SignUpView(),
          settings: const RouteSettings(name: SIGNUP),
        );
      case LOGIN:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
          settings: const RouteSettings(name: LOGIN),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
