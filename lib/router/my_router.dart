import 'package:flutter_task1_muskan/screens/dashboard_screen.dart';
import 'package:flutter_task1_muskan/screens/registration_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task1_muskan/screens/login_screen.dart';

class MyRouter{

  static var _isLogin = false;
  // static var _isDashboard = false;
  MyRouter({required bool isLogin}){
    _isLogin = isLogin;
    // _isDashboard = isDashboard;
  }

  static String registrationScreen = "/registrationScreen";
  static String loginScreen = "/";
  static String dashboardScreen = "/dashboardScreen";

  final router = GoRouter(
    routes: [
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
    redirect: (context, state){
      if(!_isLogin) {
        return MyRouter.dashboardScreen;
      }
      return null;
    }
  );
}