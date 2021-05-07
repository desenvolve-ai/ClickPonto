import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Drawer/drawerNavigator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var lista = [];

  @override
  void initState() {
    lista.add('13:00 - Av Presidente Vargas N° 1238');
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home')),
      drawer: MainDrawer(),
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
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
                    child: ElevatedButton.icon(
                      onPressed: () {
                        var data = DateTime.now();
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Confirmação de Registro'),
                            content:
                                Text('Deseja realmente registrar o ponto?'),
                            actions: [
                              TextButton(
                                child: Text('Confirmar'),
                                onPressed: () {
                                  setState(() {
                                    var data = DateTime.now();

                                    lista.add(DateFormat("dd/MM/yyyy HH:mm")
                                            .format(data) +
                                        '      Avenida Pres. Vargas N° 5276');
                                  });

                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text('Registro realizado com sucesso'),
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
                          ),
                        );
                      },
                      icon: Icon(Icons.alarm),
                      label: Text('Registrar Ponto'),
                      style: ElevatedButton.styleFrom(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'útimas Marcações',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    width: 300,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Center(
                            child: Text(
                              lista[index],
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 1,
                        );
                      },
                      itemCount: lista.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
