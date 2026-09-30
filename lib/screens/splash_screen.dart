import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(

        child: FutureBuilder(
          future: rootBundle.load('assets/icons/logo.svg'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasError) {
              return SvgPicture.asset('assets/icons/logo.svg', width: 160);
            }
            return const Text(
              'Khabar',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            );
          },
        ),
      ),
    );
  }
}
