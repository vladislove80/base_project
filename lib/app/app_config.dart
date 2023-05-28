import 'package:base_project/app/app_mock_config.dart';

class AppConfig {
  const AppConfig({
    this.appMockSettings = const AppMockConfig(),
  });

  final AppMockConfig appMockSettings;
}
