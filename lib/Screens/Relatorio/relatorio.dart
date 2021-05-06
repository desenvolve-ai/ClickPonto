import 'package:flutter/material.dart';

import '../Drawer/drawerNavigator.dart';

class Relatorio extends StatefulWidget {
  @override
  _RelatorioState createState() => _RelatorioState();
}

class _RelatorioState extends State<Relatorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home')),
      drawer: MainDrawer(),
      
      body: Center(
        child: Text('Tela Relatorio'),
      ),
    );
  }
}
