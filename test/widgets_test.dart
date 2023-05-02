import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_clone/features/authentication/views/widgets/form_button.dart';

void main() {
  group('Form Button Test', () {
    testWidgets('Disabled State DarkMode', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MediaQuery(
          data: MediaQueryData(
            platformBrightness: Brightness.dark,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: FormButton(
              disabled: true,
              buttonText: '',
            ),
          ),
        ),
      );
      expect(
        (tester
                .firstWidget<AnimatedContainer>(find.byType(AnimatedContainer))
                .decoration as BoxDecoration)
            .color,
        Colors.grey.shade800,
      );
    });
    testWidgets('Disabled State LightMode', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MediaQuery(
          data: MediaQueryData(
            platformBrightness: Brightness.light,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: FormButton(
              disabled: true,
              buttonText: '',
            ),
          ),
        ),
      );
      expect(
        (tester
                .firstWidget<AnimatedContainer>(find.byType(AnimatedContainer))
                .decoration as BoxDecoration)
            .color,
        Colors.grey.shade300,
      );
    });
  });
}
