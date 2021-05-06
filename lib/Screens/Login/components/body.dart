import 'package:flutter/material.dart';
import 'package:workhours/Screens/Login/components/background.dart';
import 'package:workhours/Screens/Signup/signup_screen.dart';
import 'package:workhours/components/jacadastrado.dart';
import 'package:workhours/components/botao.dart';
import 'package:workhours/components/campoemail.dart';
import 'package:workhours/components/camposenha.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
              )
            ) ,
            SizedBox(height: size.height * 0.03),
            Campoemail(
              hintText: "Email",
              onChanged: (value) {},
            ),
            Camposenha(
              onChanged: (value) {},
            ),
            Botao(
              text: "Entrar",
              press: () {
                 Navigator.pop(context);
                  Navigator.pushNamed(context, '/home');
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
