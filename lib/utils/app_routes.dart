import 'package:flutter/material.dart';
import '../views/screens/splash_screen.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/login_screen.dart';
import '../views/screens/signup_screen.dart';
import '../views/screens/otp_verification_screen.dart';
import '../views/screens/onboarding_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String otpVerification = '/otp-verification';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    otpVerification: (context) => const OtpVerificationScreen(),
    onboarding: (context) => const OnboardingScreen(),
    home: (context) => const HomeScreen(),
  };
}