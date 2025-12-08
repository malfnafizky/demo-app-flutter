import 'package:demo_app/core/app_color.dart';
import 'package:demo_app/pages/dashboard/dashboard_page.dart';
import 'package:demo_app/pages/home/home_page.dart';
import 'package:demo_app/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
            tooltip: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppPallete.primaryColor,
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
      body: <Widget>[HomePage(), DashboardPage(), ProfilePage()][_selectedPage],
    );
  }
}
