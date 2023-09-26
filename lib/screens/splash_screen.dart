import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task1_muskan/providers/shared_preference_provider.dart';
import 'package:flutter_task1_muskan/router/my_router.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      navigation();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: Image.asset(
          'assets/images/splash_logo.jpg',
          height: 150,
          width: 150,
        )),
      ),
    );
  }

  void navigation() {
    final token = ref.read(sharedUtilityProvider).getToken();
    if (token.isEmpty) {
      context.goNamed(MyRouter.loginScreen);
    } else {
      context.goNamed(MyRouter.dashboardScreen);
    }
  }
}
