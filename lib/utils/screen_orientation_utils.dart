import 'package:flutter/services.dart';

class ScreenOrientation {
  static Future<void> setPortrait() => SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

  static Future<void> setLandscape() => SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
}
