import 'package:flutter/cupertino.dart';
import 'package:flutter_task1_muskan/router/scaffold_with_nested_navigation.dart';
import 'package:flutter_task1_muskan/screens/dashboard_screen.dart';
import 'package:flutter_task1_muskan/screens/profile_screen.dart';
import 'package:flutter_task1_muskan/screens/registration_screen.dart';
import 'package:flutter_task1_muskan/screens/settings_screen.dart';
import 'package:flutter_task1_muskan/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task1_muskan/screens/login_screen.dart';

class MyRouter {
  static String registrationScreen = "/registrationScreen";
  static String loginScreen = "/loginScreen";
  static String dashboardScreen = "/dashboardScreen";
  static String splashScreen = "/";
  static String profileScreen = "/profileScreen";
  static String settingsScreen = "/settingsScreen";

  final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
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
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
                navigatorKey:
                    GlobalKey<NavigatorState>(debugLabel: 'shellHome'),
                routes: [
                  GoRoute(
                    name: dashboardScreen,
                    path: dashboardScreen,
                    builder: (context, state) => const DashboardScreen(),
                  ),
                ]),
            StatefulShellBranch(
                navigatorKey:
                    GlobalKey<NavigatorState>(debugLabel: 'shellSettings'),
                routes: [
                  GoRoute(
                    name: settingsScreen,
                    path: settingsScreen,
                    builder: (context, state) => const SettingsScreen(),
                  ),
                ]),
            StatefulShellBranch(
                navigatorKey:
                    GlobalKey<NavigatorState>(debugLabel: 'shellProfile'),
                routes: [
                  GoRoute(
                    name: profileScreen,
                    path: profileScreen,
                    builder: (context, state) => const ProfileScreen(),
                  ),
                ]),
          ]),
    ],
  );
}
