import 'package:flutter_task1_muskan/screens/dashboard_screen.dart';
import 'package:flutter_task1_muskan/screens/registration_screen.dart';
import 'package:flutter_task1_muskan/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task1_muskan/screens/login_screen.dart';

class MyRouter{

  static String registrationScreen = "/registrationScreen";
  static String loginScreen = "/loginScreen";
  static String dashboardScreen = "/dashboardScreen";
  static String splashScreen = "/";

  final router = GoRouter(
    routes: [
      GoRoute(
        name: splashScreen,
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        name: registrationScreen,
        path: registrationScreen,
        builder: (context, state) => const RegistrationScreen(),
      ),

      GoRoute(
        name: loginScreen,
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        name: dashboardScreen,
        path: dashboardScreen,
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
  );
}