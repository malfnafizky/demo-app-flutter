import 'package:auto_route/auto_route.dart';
import 'package:demo_app/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'SplashRoute')
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 2)); // animasi splash

    // misalnya cek dari SharedPreferences
    final isLoggedIn = false; // contoh hardcoded, nanti diganti auth asli

    if (!mounted) return;

    if (isLoggedIn) {
      context.replaceRoute(const MainRoute());
    } else {
      context.replaceRoute(const SignInRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Splash Screen")));
  }
}
