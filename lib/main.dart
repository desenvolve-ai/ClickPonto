import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workhours/Screens/Login/login_screen.dart';
import 'package:workhours/Screens/Perfil/perfil.dart';
import 'package:workhours/Screens/Welcome/welcome_screen.dart';
import 'Screens/BottomNavigator/bottomNavBar.dart';
import 'Screens/Sobre/sobre.dart';

Future<void> main() async {
  //Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ClickPonto',
    home: BottomNavBar(),
    theme: ThemeData(
      primaryColor: Color.fromRGBO(111, 53, 165, 1),
    ),
    initialRoute: '/login',
    routes: {
      '/welcome': (context) => WelcomeScreen(),
      '/home': (context) => BottomNavBar(),
      '/sobre': (context) => Sobre(),
      '/login': (context) => LoginScreen(),
      '/perfil': (context) => Perfil(),
    },
  ));
}
