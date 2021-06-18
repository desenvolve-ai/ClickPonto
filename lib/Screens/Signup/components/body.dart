import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clickponto/Screens/Login/login_screen.dart';
import 'package:clickponto/Screens/Signup/components/or_divider.dart';
import 'package:clickponto/Screens/Signup/components/social_icon.dart';
import 'package:clickponto/components/jacadastrado.dart';
import 'package:clickponto/components/botao.dart';
import 'package:clickponto/components/campoemail.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late CollectionReference usuarios;

  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtCpf  = TextEditingController();

  @override
  void initState() {
    super.initState();
    usuarios = FirebaseFirestore.instance.collection('usuarios');
  }

  void criarConta(nome, cpf, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {

      var db = FirebaseFirestore.instance;

      db.collection('usuarios').doc(resultado.user!.uid).set({
        'nome': nome,
        'cpf': cpf,
        'email': email,
        'senha': senha,
      }).then((value) {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Usuário criado com sucesso'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.greenAccent,
        ));
        
        Navigator.pushNamed(context, '/login');
      });
    }).catchError((erro) {
      debugPrint(erro.code);
      if (erro.code == 'email-already-in-use') {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('O email informado já está em uso.'),
          duration: Duration(seconds: 2),
           backgroundColor: Colors.redAccent,  
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro: ${erro.message}'),
          duration: Duration(seconds: 2),
           backgroundColor: Colors.redAccent,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
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
              controller: txtNome,
              hintText: "Nome",
              onChanged: (value) {},
            ),
            Campoemail(
              obscureText: false,
              controller: txtCpf,
              hintText: "CPF",
              onChanged: (value) {},
            ),
            Campoemail(
              controller: txtEmail,
              hintText: "Email",
              onChanged: (value) {},
            ),
            Campoemail(
              obscureText: true,
              controller: txtSenha,
              hintText: "Senha",
              onChanged: (value) {},
            ),
            Botao(
              text: "Cadastrar",
              press: () {
                criarConta(txtNome.text, txtCpf, txtEmail.text, txtSenha.text);
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
