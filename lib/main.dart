import 'package:base_project/app/app.dart';
import 'package:base_project/app/app_config.dart';
import 'package:base_project/app/app_mock_config.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

Future<void> main({
  AppMockConfig? appMockSettings,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  App.isTestRun = appMockSettings?.isTestRun ?? false;
  EquatableConfig.stringify = true;

  final mockSettings = App.isStaging
      ? appMockSettings ??
          const AppMockConfig(
            isMocked: false,
          )
      : const AppMockConfig();
  await runBaseProjectApp(
    AppConfig(
      appMockSettings: mockSettings,
    ),
  );
}