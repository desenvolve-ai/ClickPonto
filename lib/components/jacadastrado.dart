import 'package:flutter/material.dart';
import 'package:workhours/constants.dart';

class Jacadastrado extends StatelessWidget {
  final bool login;
  final Function press;
  const Jacadastrado({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Ainda não possui cadastro ? " : "Já possui cadastro ? ",
          style: TextStyle(color: cor1),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Cadastre-se" : "Entrar",
            style: TextStyle(
              color: cor1,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
