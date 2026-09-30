import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khabar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
