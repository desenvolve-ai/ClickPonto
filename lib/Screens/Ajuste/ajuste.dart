import 'package:flutter/material.dart';
import 'package:workhours/Screens/Drawer/drawerNavigator.dart';

class Ajuste extends StatefulWidget {
  @override
  _AjusteState createState() => _AjusteState();
}

enum Motivo { AtestadoMedico, Esquecimento }

class _AjusteState extends State<Ajuste> {
  Motivo _motivo = Motivo.AtestadoMedico;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Ajustes')),
      drawer: MainDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'A Justificativa de ausência deve ser utilizada caso você tenha marcações faltantes.',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  onChanged: null,
                  cursorColor: null,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                    ),
                    hintText: 'Informe a Data',
                    border: InputBorder.none,
                    labelText: 'Data',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                TextField(
                  onChanged: null,
                  cursorColor: null,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                    ),
                    hintText: 'Informe o período',
                    border: InputBorder.none,
                    labelText: 'Período',
                  ),
                ),
                TextField(
                  maxLines: 3,
                  onChanged: null,
                  cursorColor: null,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.chat_bubble_outline_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    hintText: 'Informe a Observação',
                    border: InputBorder.none,
                    labelText: 'Observação',
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Motivo',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    RadioListTile<Motivo>(
                      title: const Text('Atestado Médico'),
                      value: Motivo.AtestadoMedico,
                      groupValue: _motivo,
                      onChanged: (value) {
                        setState(() {
                          _motivo = value;
                        });
                      },
                    ),
                    RadioListTile<Motivo>(
                      title: const Text('Esquecimento'),
                      value: Motivo.Esquecimento,
                      groupValue: _motivo,
                      onChanged: (value) {
                        setState(() {
                          _motivo = value;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 175),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Solicitação de Ajuste Realizada com Sucesso'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ));
                    },
                    icon: Icon(Icons.save),
                    label: Text('Concluir'),
                    
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
        ),
      ),
    );
  }
}
