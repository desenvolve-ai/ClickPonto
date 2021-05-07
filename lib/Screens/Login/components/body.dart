import 'package:flutter/material.dart';
import 'package:workhours/Screens/Login/components/background.dart';
import 'package:workhours/Screens/Signup/signup_screen.dart';
import 'package:workhours/components/jacadastrado.dart';
import 'package:workhours/components/botao.dart';
import 'package:workhours/components/campoemail.dart';
import 'package:workhours/components/camposenha.dart';

class Usuario {
  final String email;
  final String senha;

  Usuario(this.email, this.senha);
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var txtusuario = TextEditingController();
  var txtsenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Entrar",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Center(
                child: CircleAvatar(
              radius: size.height * 0.20,
              backgroundImage: AssetImage('images/Clickponto.jpg'),
            )),
            SizedBox(height: size.height * 0.03),
            Campoemail(
              hintText: "Usuário",
              onChanged: (value1) {},
              controller: txtusuario,
            ),
            Camposenha(
              onChanged: (value2) {},
              controller: txtsenha,
            ),
            Botao(
              text: "Entrar",
              press: () {
                if (txtusuario.text != '' || txtsenha.text != '') {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/home');
                } else
                  (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(' Usuario e senha devem ser preenchidos! '),
                    duration: Duration(seconds: 3),
                    backgroundColor: Colors.redAccent,
                  )));
              },
            ),
            SizedBox(height: size.height * 0.03),
            Jacadastrado(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
