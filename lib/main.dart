import 'dart:ui';
import 'package:flutter/material.dart';
import 'Screens/bottomNavBar.dart';
import 'Screens/login.dart';
import 'Screens/sobre.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigator',
    home: BottomNavBar(),
    theme: ThemeData(
      primaryColor: Color.fromRGBO(111, 53, 165, 1),
    ),
    initialRoute: '/home',
    routes: {
      '/home': (context) => BottomNavBar(),
      '/sobre': (context) => Sobre(),
      '/login': (context) => Login(),
    },
  ));
}

