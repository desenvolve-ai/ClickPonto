import 'package:flutter/material.dart';

class ListHome extends StatelessWidget {
  
  final List<dynamic> ?lista;


  const ListHome({ 
    Key? key,
    this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Ultimos Registros',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Center(
                            child: Text(
                              lista![index],
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
                      itemCount: lista!.length,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}