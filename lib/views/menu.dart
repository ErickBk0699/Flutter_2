import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/getfirebase.dart';
import 'package:flutter_application_2/views/home.dart';
import 'package:flutter_application_2/views/listview_2.dart';
import 'package:flutter_application_2/views/porfile.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => MenuS();
}

class MenuS extends State<Menu> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    GetFireBase(),
    ListView2(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Car Wash'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 87, 199, 255)),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_repair),
              label: 'Service',
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_crash),
              label: 'Game',
              backgroundColor: Color.fromARGB(255, 125, 170, 164)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color.fromARGB(255, 4, 1, 32)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
