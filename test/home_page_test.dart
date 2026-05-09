import 'package:ads_sw3/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets(
    'Home page displays ads correctly',
    (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      // التحقق من عنوان الصفحة
      expect(
        find.text('الإعلانات المتاحة'),
        findsOneWidget,
      );

      // التحقق من عدد الإعلانات
      expect(
        find.text('عدد الإعلانات: 3'),
        findsOneWidget,
      );

      // التحقق من وجود الإعلانات
      expect(
        find.text('محرك سيارة تويوتا'),
        findsOneWidget,
      );

      expect(
        find.text('إطارات ميشلان أصلية'),
        findsOneWidget,
      );

      expect(
        find.text('أضواء أمامية LED'),
        findsOneWidget,
      );

      // وجود زر الإضافة
      expect(
        find.byType(FloatingActionButton),
        findsOneWidget,
      );
    },
  );
}