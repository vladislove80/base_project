import 'package:base_project/app/base_project_app.dart';
import 'package:base_project/feature_splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteBuilder {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BaseProjectApp.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
