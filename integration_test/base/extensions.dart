import 'package:flutter_test/flutter_test.dart';

import 'base.dart';

extension ExtendedWidgetController on WidgetController {
  T widgetByType<T>() => widget(find.byType(T)) as T;
}

extension ExtendedWidgetTester on WidgetTester {
  Future<int> initialPumpAndSettle([Duration? duration]) async {
    await pump(duration);
    await pumpAndSettle(TestDelay.durationMedium);
    return pumpAndSettle();
  }
}
