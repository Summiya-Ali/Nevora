import 'package:assignment1/onboarding/Onboarding3.dart';
import 'package:assignment1/onboarding/Onboarding4.dart';
import 'package:flutter/material.dart';
import 'onboarding/MyHome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding/Onboarding1.dart';
import 'onboarding/Onboarding2.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'onboarding/custom_avatar_curve.dart';
import 'onboarding/Apppbar.dart';
void main() {
  //debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color vibrantGold = Color(0xFFEDC967); // Classic gold

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFF121212), // Dark background
        colorScheme: ColorScheme.fromSeed(
          seedColor: vibrantGold,
           brightness: Brightness.dark,
        ),

        // 💡 Apply gold text color globally
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.dark().textTheme,
        ).apply(
          bodyColor: vibrantGold,
          displayColor: vibrantGold,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D7377),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "Habits"),

    );
  }
}
