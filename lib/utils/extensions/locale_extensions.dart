import 'dart:ui';

Locale localeFromString(String localeName) {
  final localeElements = localeName.split('_');
  final languageCode = localeElements.first;
  String? countryCode;
  if (localeElements.length > 1) {
    countryCode = localeElements.last.split('.').first;
  }
  return Locale(languageCode, countryCode);
}
