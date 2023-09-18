import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/screens/dashboard_screen.dart';
import 'package:flutter_task1_muskan/screens/registration_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task1_muskan/screens/login_screen.dart';
import 'package:flutter_task1_muskan/providers/shared_preference_provider.dart';

class MyRouter{

  static var _isLogin;
  MyRouter({required bool isLogin}){
    _isLogin = isLogin;
  }

  static String registrationScreen = "/registrationScreen";
  static String loginScreen = "/";
  static String dashboardScreen = "/dashboardScreen";

  final router = GoRouter(
    routes: [
      GoRoute(
        name: registrationScreen,
        path: '/registrationScreen',
        builder: (context, state) => RegistrationScreen(),
      ),

      GoRoute(
        name: loginScreen,
        path: '/',
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        name: dashboardScreen,
        path: '/dashboardScreen',
        builder: (context, state) => DashboardScreen(),
      ),
    ],
    redirect: (context, state){
      if(!_isLogin) {
        return MyRouter.dashboardScreen;
      }
      return null;
    }
  );
}