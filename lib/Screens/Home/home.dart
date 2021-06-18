import 'package:clickponto/models/Ponto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Drawer/drawerNavigator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CollectionReference listaPontos;
  final endereco = "Avenida Pres. Vargas N° 5276";

  @override
  void initState() {
    super.initState();
    listaPontos = FirebaseFirestore.instance.collection('pontos');
  }

  Widget handleListPontos(item) {
    Ponto ponto = Ponto.fromJson(item.data(), item.id);

    print(ponto.endereco);
    var date = DateTime.fromMicrosecondsSinceEpoch(ponto.dataHora.microsecondsSinceEpoch * 1);
    return Container(
        padding: EdgeInsets.all(5),
        child: Center(
          child: ListTile(
            title: Text(date.toString(),
                style: TextStyle(fontSize: 14)),
            subtitle: Text(
              ponto.endereco,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ));
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var id = ModalRoute.of(context)?.settings.arguments;
    print(id);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home')),
      drawer: MainDrawer(id:id.toString()),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'Banco de Horas',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      child: Text(
                        '16:00hrs',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            'Avenida Pres. Vargas N° 5276',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.06,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Confirmar Registro'),
                                content:
                                    Text('Deseja realmente registrar o ponto?'),
                                actions: [
                                  TextButton(
                                    child: Text('Confirmar'),
                                    onPressed: () {
                                      var db = FirebaseFirestore.instance;

                                      var datahora = Timestamp.now();

                                      db.collection('pontos').add({
                                        'endereco': endereco,
                                        'dataHora': datahora,
                                        'idUsuario': id,
                                      });
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Registro realizado com sucesso'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.green,
                                      ));
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Cancelar'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                                elevation: 5,
                                backgroundColor: Color(0xFFF1E6FF),
                              ),
                            );
                          },
                          icon: Icon(Icons.alarm),
                          label: Text('Registrar Ponto'),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.black,
                              primary: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(29),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width * 0.40,
              child: Center(
                child: StreamBuilder<QuerySnapshot>(
                  stream: listaPontos.snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(
                            child: Text('Erro ao conectar ao Firestore'));

                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());

                      default:
                        final dados = snapshot.requireData;

                        return ListView.builder(
                            itemCount: dados.size,
                            itemBuilder: (context, index) {
                              print(dados.docs[index].id);
                              return handleListPontos(dados.docs[index]);
                            });
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
