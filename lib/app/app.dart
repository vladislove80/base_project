import 'package:base_project/app/app_config.dart';
import 'package:base_project/app/base_project_app.dart';
import 'package:base_project/injection_container.dart' as di;
import 'package:base_project/utils/screen_orientation_utils.dart';
import 'package:flutter/material.dart';

class App {
  static bool isTestRun = false;

  static bool get isStaging =>
      isTestRun || const bool.fromEnvironment('staging');
}

Future<void> runBaseProjectApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init(appConfig);
  await ScreenOrientation.setPortrait();

  runApp(const BaseProjectApp());
}
