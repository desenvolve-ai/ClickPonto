import 'package:flutter/material.dart';
import 'package:clickponto/Screens/Ajuste/ajuste.dart';

import '../Drawer/drawerNavigator.dart';
import '../Home/home.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex =0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Ajuste(),
  ];

  void _onTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: 
          const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.toc_outlined),
              label: 'Ajustes',
            ),
          ]
        ,
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
