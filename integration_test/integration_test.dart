import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAuth.instance.signOut();
  });

  testWidgets('Create Account Flow', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: App(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Sign Up for Tiktok'), findsOneWidget);
    final logIn = find.text('Log in');
    expect(logIn, findsOneWidget);
    await tester.tap(logIn);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    final signUp = find.text('Sign Up');
    expect(signUp, findsOneWidget);
    await tester.tap(signUp);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    final emailBtn = find.text('Continue with Email & Password');
    expect(emailBtn, findsOneWidget);
    await tester.tap(emailBtn);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    final usernameInput = find.byType(TextField).first;
    await tester.enterText(usernameInput, "test");
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.text("Next"));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    final emailInput = find.byType(TextField).first;
    await tester.enterText(emailInput, "test@testing.com");
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.text("Next"));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    final pwInput = find.byType(TextField).first;
    await tester.enterText(pwInput, "qweQ123@!");
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.text("Next"));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.text("Next"));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });
}
