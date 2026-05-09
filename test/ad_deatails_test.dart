import 'package:ads_sw3/ad_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets(
    'Ad details page displays ad information correctly',
    (WidgetTester tester) async {

      final testAd = {
        'title': 'محرك تويوتا',
        'price': '5000 ريال',
        'publisher': 'أحمد',
        'date': '2025-05-01',
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdDetailsPage(),
                      settings: RouteSettings(
                        arguments: testAd,
                      ),
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      // فتح الصفحة
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      // التحقق من البيانات
      expect(find.text('محرك تويوتا'), findsWidgets);

      expect(find.text('السعر: 5000 ريال'),
          findsOneWidget);

      expect(find.text('الناشر: أحمد'),
          findsOneWidget);

      expect(find.text('تاريخ النشر: 2025-05-01'),
          findsOneWidget);

      expect(find.text('اتصل بالبائع'),
          findsOneWidget);
    },
  );

  testWidgets(
    'Delete dialog appears correctly',
    (WidgetTester tester) async {

      final testAd = {
        'title': 'محرك تويوتا',
        'price': '5000 ريال',
        'publisher': 'أحمد',
        'date': '2025-05-01',
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdDetailsPage(),
                      settings: RouteSettings(
                        arguments: testAd,
                      ),
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      // فتح الصفحة
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      // الضغط على حذف
      await tester.tap(find.byIcon(Icons.delete));

      await tester.pumpAndSettle();

      // التحقق من ظهور Dialog
      expect(find.text('حذف الإعلان'),
          findsOneWidget);

      expect(
        find.text('هل أنت متأكد من حذف هذا الإعلان؟'),
        findsOneWidget,
      );

      expect(find.text('إلغاء'),
          findsOneWidget);

      expect(find.text('حذف'),
          findsOneWidget);
    },
  );
}