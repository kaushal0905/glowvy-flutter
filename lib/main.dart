import 'package:flutter/material.dart';
import 'package:glowvy/Screens/splash_screen.dart';
import 'package:glowvy/Utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glowvy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.white),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppTheme.black,
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}