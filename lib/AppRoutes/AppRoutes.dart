import 'package:flutter/material.dart';
import 'package:cavemen/Screens/Onboard/Onboarding1.dart';

import '../Screens/Login/LoginScreen.dart';
import '../Screens/Splash/Splash.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    onboarding: (context) => OnboardingScreen(),
    login: (context) => LoginScreen(),
  };
}