import 'package:base_project/generated/intl/messages_all.dart';
import 'package:base_project/localization/string_resourses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations with StringResources {
  static const supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];


  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  static Future<AppLocalizations> load(Locale locale) async {
    final localeName = Intl.canonicalizedLocale(locale.languageCode);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales
      .map((e) => e.languageCode)
      .contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension StringExtension on String {
  String get errorCodeResource => 'errorCode';
}