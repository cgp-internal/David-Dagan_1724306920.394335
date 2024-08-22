import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

import 'package:my_app/provider.dart' show AppProvider;
import 'package:my_app/features/feature1/feature1_screen.dart' show Feature1Screen;
import 'package:my_app/features/feature2/feature2_screen.dart' show Feature2Screen;

void main() {
  group('Widget tests', () {
    testWidgets('Feature 1 screen test', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appProvider OverrideWith Provider((ref) => AppProvider()),
          ],
          child: MaterialApp(
            home: Feature1Screen(),
          ),
        ),
      );
      expect(find.byType(Feature1Screen), findsOneWidget);
    });

    testWidgets('Feature 2 screen test', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appProvider OverrideWith Provider((ref) => AppProvider()),
          ],
          child: MaterialApp(
            home: Feature2Screen(),
          ),
        ),
      );
      expect(find.byType(Feature2Screen), findsOneWidget);
    });
  });
}