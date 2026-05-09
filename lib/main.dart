import 'package:ads_sw3/home_page.dart';
import 'package:ads_sw3/login_page.dart';
import 'package:ads_sw3/register_page.dart';
import 'package:flutter/material.dart';
 import 'package:ads_sw3/ad_details_page.dart';


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
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/ad_details': (context) => const AdDetailsPage(),
      },
    );
  }
}