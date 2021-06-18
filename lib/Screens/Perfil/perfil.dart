import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtCpf = TextEditingController();

  void getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .get()
        .then((valor) {
      txtNome.text = valor.get('nome');
      txtEmail.text = valor.get('email');
      txtCpf.text = valor.get('cpf');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) getDocumentById(id.toString());

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Perfil')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://static1.purepeople.com.br/articles/4/30/94/04/@/3499253-neymar-faz-gol-e-comemoracao-agita-shipp-624x600-2.jpg'),
              ),
            )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 100),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: null,
                        cursorColor: null,
                        controller: txtNome,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.people,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintText: 'Digite seu nome',
                          border: InputBorder.none,
                          labelText: 'Nome',
                        ),
                      ),

                      TextField(
                        onChanged: null,
                        cursorColor: null,
                        controller: txtCpf,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.people,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintText: 'Digite seu CPF',
                          border: InputBorder.none,
                          labelText: 'CPF',
                        ),
                        keyboardType: TextInputType.number,
                      ),

                      TextField(
                        onChanged: null,
                        cursorColor: null,
                        controller: txtEmail,
                        enabled: false,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.mail,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintText: 'Digite seu E-mail',
                          border: InputBorder.none,
                          labelText: 'E-mail',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      // TextField(
                      //   onChanged: null,
                      //   cursorColor: null,
                      //   decoration: InputDecoration(
                      //     icon: Icon(
                      //       Icons.calendar_today,
                      //       color: Theme.of(context).primaryColor,
                      //     ),
                      //     hintText: 'dd/MM/yyyy',
                      //     border: InputBorder.none,
                      //     labelText: 'Data Nascimento',
                      //   ),
                      //   keyboardType: TextInputType.datetime,
                      // ),
                      // TextField(
                      //   onChanged: null,
                      //   cursorColor: null,
                      //   decoration: InputDecoration(
                      //     icon: Icon(
                      //       Icons.phone,
                      //       color: Theme.of(context).primaryColor,
                      //     ),
                      //     hintText: 'Digite seu Telefone',
                      //     border: InputBorder.none,
                      //     labelText: 'Telefone',
                      //   ),
                      //   keyboardType: TextInputType.emailAddress,
                      // ),
                      // TextField(
                      //   onChanged: null,
                      //   cursorColor: null,
                      //   decoration: InputDecoration(
                      //     icon: Icon(
                      //       Icons.people,
                      //       color: Theme.of(context).primaryColor,
                      //     ),
                      //     hintText: 'Digite seu Gênero',
                      //     border: InputBorder.none,
                      //     labelText: 'Gênero',
                      //   ),
                      //   keyboardType: TextInputType.emailAddress,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  var db = FirebaseFirestore.instance;

                  db.collection('usuarios').doc(id.toString()).update({
                    'nome': txtNome.text,
                    'cpf': txtCpf.text,
                  });

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Perfil salvo com sucesso!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ));
                },
                icon: Icon(Icons.save),
                label: Text('Salvar'),
                style: ElevatedButton.styleFrom(
                    elevation: 20,
                    minimumSize: Size(150, 50),
                    shadowColor: Colors.black,
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
