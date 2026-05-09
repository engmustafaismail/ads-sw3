import 'package:ads_sw3/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login page shows all fields correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // التحقق من وجود الحقول
    expect(find.byType(TextFormField), findsNWidgets(2));

    expect(find.text('البريد الإلكتروني'), findsOneWidget);

    expect(find.text('كلمة المرور'), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Invalid email shows validation error', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // إدخال بريد خاطئ
    await tester.enterText(find.byType(TextFormField).first, 'wrongemail');

    // كلمة مرور صحيحة
    await tester.enterText(find.byType(TextFormField).last, '123456');

    // الضغط على الزر
    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    // التحقق من ظهور الخطأ
    expect(find.text('أدخل بريداً صالحاً'), findsOneWidget);
  });

  testWidgets('Short password shows validation error', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // بريد صحيح
    await tester.enterText(find.byType(TextFormField).first, 'test@gmail.com');

    // كلمة مرور قصيرة
    await tester.enterText(find.byType(TextFormField).last, '123');

    // الضغط على الزر
    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    // التحقق من ظهور الخطأ
    expect(find.text('كلمة المرور قصيرة جداً'), findsOneWidget);
  });
}
