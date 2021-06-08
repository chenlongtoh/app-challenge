import 'dart:developer';

import 'package:flutter/material.dart';

import 'app_settings/ui/page/app_settings.dart';
import 'bluetooth/ui/page/bluetooh.dart';
import 'helmet/ui/page/helmet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final _pageList = [
    AppSettings(),
    Helmet(),
    BlueetoothPage(),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: _pageList, index: _currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            title: Container(height: 10),
            // label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_motorsports_outlined),
            title: Container(height: 10),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 40,
              child: Stack(
                children: [
                  Icon(Icons.fiber_manual_record_outlined),
                  Positioned(left: 17, child: Icon(Icons.fiber_manual_record_outlined)),
                ],
              ),
            ),
            title: Container(height: 10),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
