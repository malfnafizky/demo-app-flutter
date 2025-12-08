import 'package:demo_app/core/theme.dart';
import 'package:demo_app/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: AppTheme.lightThemeMode,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
