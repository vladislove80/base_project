import 'package:base_project/app/app_mock_config.dart';
import 'package:base_project/injection_container.dart';
import 'package:base_project/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

class TestUtils {
  static dynamic setupFunction({
    AuthMockConfig? authMockConfig,
    TestsConfig testsConfig = const TestsConfig(
      isTestRun: true,
      skipSplash: true,
    ),
  }) {
    app.main(
      appMockSettings: AppMockConfig(
        isMocked: true,
        authMockConfig:
            authMockConfig ?? const AuthMockConfig(isUserLoggedIn: false),
        testsConfig: testsConfig,
      ),
    );
  }

  static dynamic setupFunctionLoggedOut() => setupFunction();

  static dynamic setupFunctionWithOptionalArguments({
    AuthMockConfig? authMockConfig,
  }) =>
      setupFunction(authMockConfig: authMockConfig);

  static Future<void> resetDI() async {
    await sl.reset();
  }

  static Future<void> clearSharedPrefs() async {
    await (await SharedPreferences.getInstance()).clear();
  }

  static Future<void> tearDownFunction() async {
    await clearSharedPrefs();
    await resetDI();
  }
}

class TestDelay {
  static const durationSmall = Duration(milliseconds: 200);
  static const durationMedium = Duration(milliseconds: 500);
  static const durationLarge = Duration(milliseconds: 1000);
  static const durationXLarge = Duration(milliseconds: 2000);
  static const durationXXLarge = Duration(milliseconds: 4000);
  static const durationXXXLarge = Duration(milliseconds: 8000);
  static const durationBreakTimer = Duration(seconds: 60);
}