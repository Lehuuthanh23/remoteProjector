import 'package:flutter/material.dart';
import 'package:remote_project/features/account/account_page.dart';
import 'package:remote_project/features/camp/camp_page.dart';
import 'package:remote_project/features/device/dir_page.dart';
import 'package:remote_project/features/navigation_bar/nav_bar.dart';
import 'package:remote_project/features/packet/packet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DirPage(),
    const PacketPage(),
    const CampPage(),
    const AccountPage(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: HomeNavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}

class PackagePage {}
