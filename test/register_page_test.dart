import 'package:ads_sw3/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets(
    'Register page displays all fields correctly',
    (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      // التحقق من عدد الحقول
      expect(
        find.byType(TextFormField),
        findsNWidgets(4),
      );

      // التحقق من النصوص
      expect(
        find.text('الاسم الكامل'),
        findsOneWidget,
      );

      expect(
        find.text('البريد الإلكتروني'),
        findsOneWidget,
      );

      expect(
        find.text('كلمة المرور'),
        findsOneWidget,
      );

      expect(
        find.text('تأكيد كلمة المرور'),
        findsOneWidget,
      );

      // وجود زر التسجيل
      expect(
        find.byType(ElevatedButton),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Password mismatch shows validation error',
    (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      // كلمة المرور
      await tester.enterText(
        find.byType(TextFormField).at(2),
        'Password123',
      );

      // تأكيد خاطئ
      await tester.enterText(
        find.byType(TextFormField).at(3),
        'WrongPassword',
      );

      // الضغط على تسجيل
      await tester.tap(
        find.byType(ElevatedButton),
      );

      await tester.pump();

      // التحقق من الخطأ
      expect(
        find.text('كلمات المرور غير متطابقة'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Short password shows validation error',
    (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      // كلمة مرور قصيرة
      await tester.enterText(
        find.byType(TextFormField).at(2),
        '123',
      );

      // الضغط على تسجيل
      await tester.tap(
        find.byType(ElevatedButton),
      );

      await tester.pump();

      // التحقق من رسالة الخطأ
      expect(
        find.text(
          'يجب أن تحتوي 8 رموز ورقم وحرف كبير',
        ),
        findsOneWidget,
      );
    },
  );
}