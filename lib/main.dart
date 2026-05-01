import 'package:ads_sw3/login_page.dart';
import 'package:flutter/material.dart';


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
      initialRoute: '/login',
      routes: {
      '/login': (context) => const LoginPage(),
      },
    );
  }
}