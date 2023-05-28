import 'package:intl/intl.dart';

mixin StringResources {

  String get someText => Intl.message(
    'Some text',
    name: 'someText',
  );

  String textWithVariable(String text) => Intl.message(
    'Some text with variable $text',
    args: [text],
    name: 'textWithVariable',
  );
}