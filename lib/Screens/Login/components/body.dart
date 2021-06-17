import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clickponto/Screens/Login/components/background.dart';
import 'package:clickponto/Screens/Signup/signup_screen.dart';
import 'package:clickponto/components/jacadastrado.dart';
import 'package:clickponto/components/botao.dart';
import 'package:clickponto/components/campoemail.dart';
import 'package:clickponto/components/camposenha.dart';

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
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;


  void login(email,senha){

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, 
      password: senha,
      )
      .then((value){
        isLoading = false;
        Navigator.pushReplacementNamed(context,'/home');
      }).catchError((erro){
        debugPrint(erro.code);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Email e/ou Senha inválidos!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.greenAccent,
        ));
      }); 


  }



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
              hintText: "E-mail",
              onChanged: (_) {},
              controller: txtEmail,
            ),
            Campoemail(
              obscureText: true,
              hintText: "Senha",
              onChanged: (_) {},
              controller: txtSenha,
            ),
            Botao(
              text: "Entrar",
              press: () {
                login(txtEmail.text, txtSenha.text);
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
