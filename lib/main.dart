import 'package:ads_sw3/ad_details_page.dart';
import 'package:ads_sw3/home_page.dart';
import 'package:ads_sw3/login_page.dart';
import 'package:ads_sw3/register_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const ClassifiedAdsApp());
}

class ClassifiedAdsApp extends StatelessWidget {
  const ClassifiedAdsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الزاهر لقطع الغيار',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Cairo',
      ),

      initialRoute: '/login',

      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/details': (context) => const AdDetailsPage(),
      },
    );
  }
}
