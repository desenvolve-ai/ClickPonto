import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Center(child: 
            TextField(
        onChanged: null,
        cursorColor: null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.alarm,
            color: Colors.black,
          ),
          hintText: 'hintText',
          border: InputBorder.none,
        ),
      ),
      ),
          
        ],),
      ),

    );
  }
}