import 'package:flutter/material.dart';
import 'package:clickponto/components/campotextogeral.dart';
import 'package:clickponto/constants.dart';

class Campoemail extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const Campoemail({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Campotextogeral(
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: cor1,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: cor1,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
