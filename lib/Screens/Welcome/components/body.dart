import 'package:flutter/material.dart';
import 'package:workhours/Screens/Login/login_screen.dart';
import 'package:workhours/Screens/Signup/signup_screen.dart';
import 'package:workhours/Screens/Welcome/components/background.dart';
import 'package:workhours/components/botao.dart';
import 'package:workhours/constants.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bem vindo ao Click Ponto!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
/*             SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ), */
            Center(
                child: CircleAvatar(
              radius: size.height * 0.20,
              backgroundImage: AssetImage('/images/Clickponto.jpg'),
            )),
            SizedBox(height: size.height * 0.05),
            Botao(
              text: "Entrar",
              press: () {
                debugPrint("teste");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            Botao(
              text: "Cadastre-se",
              color: cor2,
              textColor: Colors.black,
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
