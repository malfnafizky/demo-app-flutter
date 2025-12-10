import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/configs/app_color.dart';
import 'package:demo_app/pages/dashboard/dashboard_page.dart';
import 'package:demo_app/pages/home/home_page.dart';
import 'package:demo_app/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'MainRoute')
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
