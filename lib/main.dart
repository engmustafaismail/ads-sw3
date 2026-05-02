import 'package:flutter/material.dart';
 import 'package:ads_sw3/register_page.dart';


void main() {
  runApp(const ClassifiedAdsApp());
}

class ClassifiedAdsApp extends StatelessWidget {
  const ClassifiedAdsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الزاهر لقطع الغيار',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Cairo', // يفضل استخدام خط يدعم العربية
      ),
      initialRoute: '/registre',
      routes: {
      '/registre': (context) => const RegisterPage(),
      },
    );
  }
}