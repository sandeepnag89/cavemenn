import 'dart:async';
import 'package:cavemen/Screens/Onboard/Onboarding1.dart';
import 'package:flutter/material.dart';

import '../../AppRoutes/AppRoutes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 5), () {
    //   if (!mounted) return;
    //   Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    //  });

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          'assets/splash.png',
          fit: BoxFit.cover, // 🔥 important
        ),
      ),
    );
  }
}