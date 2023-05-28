abstract class MockConfig {}

class AppMockConfig {
  const AppMockConfig({
    this.isMocked = false,
    this.testsConfig = const TestsConfig(),
    this.authMockConfig = const AuthMockConfig(isUserLoggedIn: false),
  });

  final bool isMocked;
  final TestsConfig testsConfig;
  final AuthMockConfig authMockConfig;

  bool get shouldPrintLogs =>
      !testsConfig.isTestRun || testsConfig.isVerboseLogAllowed;

  bool get isTestRun => testsConfig.isTestRun;
}

class TestsConfig implements MockConfig {
  const TestsConfig({
    this.isTestRun = false,
    this.isVerboseLogAllowed = false,
    bool skipSplash = false,
  }) : _skipSplash = skipSplash;

  final bool isTestRun;
  final bool isVerboseLogAllowed;
  final bool _skipSplash;

  bool get skipSplash => isTestRun && _skipSplash;
}

class AuthMockConfig implements MockConfig {
  const AuthMockConfig({
    this.isUserLoggedIn = false,
  });

  final bool isUserLoggedIn;
}
