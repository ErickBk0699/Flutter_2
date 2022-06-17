import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/getfirebase.dart';
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
    Text('Bienvenidos A Mi Proshecto', style: optionStyle),
    GetFireBase(),
    //Text('Index 2: Profile', style: optionStyle),
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
        backgroundColor: Colors.blue,
        title: const Text('Car Wash'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_repair), label: 'Service'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      /* body: Container(
        alignment: Alignment.center,
        child: const Text("Home"),
        ), */
    );
  }
}
