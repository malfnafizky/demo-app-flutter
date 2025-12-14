import 'package:demo_app/domain/auth/entities/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Home Page'));
  }
}
