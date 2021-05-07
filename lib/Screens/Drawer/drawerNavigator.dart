import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage('https://static1.purepeople.com.br/articles/4/30/94/04/@/3499253-neymar-faz-gol-e-comemoracao-agita-shipp-624x600-2.jpg'
                    ),
                    fit: BoxFit.fill
                    ),
                  ),
                ),
                Text(
                  'Daniel Junio Barbosa',
                   style: TextStyle(
                     fontSize: 22,
                     color: Colors.white
                     ),
                     ),
                  Text(
              'Daniel.barbosa@gmail.com',
                style: TextStyle(
                  color: Colors.white
                  ),
                  ),
              ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Perfil',
              style: TextStyle(
                fontSize: 18,
                ),
                ),
                onTap: (){
                  Navigator.pop(context);
                   Navigator.pushNamed(context, '/perfil');
                },
          ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text(
          //     'Configurações',
          //     style: TextStyle(
          //       fontSize: 18,
          //       ),
          //       ),
          //       onTap: null,
          // ),
           ListTile(
            leading: Icon(Icons.book),
            title: Text(
              'Sobre',
              style: TextStyle(
                fontSize: 18,
                ),
                ),
                onTap: (){
                  Navigator.pop(context);
                   Navigator.pushNamed(context, '/sobre');
                },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Sair',
              style: TextStyle(
                fontSize: 18,
                ),
                ),
                onTap: (){
                  Navigator.pop(context);
                   Navigator.pushNamed(context, '/login');
                },
          ),
        ],
      ),
      
    );
  }
}