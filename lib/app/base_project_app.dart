import 'package:base_project/app/route_builder.dart';
import 'package:base_project/localization/app_localization.dart';
import 'package:base_project/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BaseProjectApp extends StatefulWidget {
  const BaseProjectApp({super.key});

  static const routeName = '/';

  @override
  State<BaseProjectApp> createState() => _BaseProjectAppState();
}

class _BaseProjectAppState extends State<BaseProjectApp> {
  late final RouteBuilder _routeBuilder;

  @override
  void initState() {
    super.initState();
    _routeBuilder = RouteBuilder();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
        ],
        theme: AppTheme.themeData(),
        onGenerateRoute: _routeBuilder.onGenerateRoute,
      );
}
