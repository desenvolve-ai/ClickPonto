import 'package:flutter/material.dart';
import 'package:workhours/components/campotextogeral.dart';
import 'package:workhours/constants.dart';

class Camposenha extends StatelessWidget {
  final ValueChanged<String> ?onChanged;
  final TextEditingController ?controller;
  const Camposenha({
    Key ?key,
    this.onChanged,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Campotextogeral(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: cor1,
        decoration: InputDecoration(
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: cor1,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: cor1,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
