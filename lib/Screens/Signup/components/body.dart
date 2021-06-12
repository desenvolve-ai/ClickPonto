import 'package:flutter/material.dart';
import 'package:clickponto/Screens/Login/login_screen.dart';
import 'package:clickponto/Screens/Signup/components/background.dart';
import 'package:clickponto/Screens/Signup/components/or_divider.dart';
import 'package:clickponto/Screens/Signup/components/social_icon.dart';
import 'package:clickponto/components/jacadastrado.dart';
import 'package:clickponto/components/botao.dart';
import 'package:clickponto/components/campoemail.dart';
import 'package:clickponto/components/camposenha.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Cadastre-se !",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Center(
                child: CircleAvatar(
              radius: size.height * 0.18,
              backgroundImage: AssetImage('images/Clickponto.jpg'),
            )),
            Campoemail(
              hintText: "Email",
              onChanged: (value) {},
            ),
            Camposenha(
              onChanged: (value) {},
            ),
            Botao(
              text: "Cadastrar",
              press: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            SizedBox(height: size.height * 0.03),
            Jacadastrado(
              login: false,
              press: () {
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
