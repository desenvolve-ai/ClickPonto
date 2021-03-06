import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(centerTitle: true, title: Text('Sobre')),
      
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), 
                topRight:  Radius.circular(50),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
            ),
            ),
            child: Column(
              children: [
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 65,
                                backgroundImage:
                                    AssetImage('images/gabriel.jpeg'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Gabriel Rodrigues da Silva',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 65,
                              backgroundImage: AssetImage('images/daniel.jpeg'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Daniel Junio Barbosa',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          "Tema",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                        Text(
                          '     Segundo o artigo N?? 74 da CLT, todo estabelecimento que conta com mais de' +
                              '     20(vinte) colaboradores, possui a obrigatoriedade de registrar os hor??rios de entrada e sa??da de seus empregados. Al??m disso, a lei tamb??m determina que essa atividade pode ser executada manual, mec??nica ou eletronicamente. Com a evolu????o na forma como esse processo ?? realizado, foram expedidas duas novas portarias que regularizam a utiliza????o de novos meios para esse registro, s??o elas as portarias 1510 e 373. \n' +
                              '     A portaria 1510 do ano de 2009, regulamenta o uso do Registrador Eletr??nico de Ponto(REP) conhecido como rel??gio de ponto cartogr??fico ou biom??trico, alocado fisicamente em uma parte espec??fica ou distribu??do em v??rias partes da empresa. J?? a portaria 373 de 2011, permite que formas alternativas de registro possam ser utilizadas, como no caso do registro de ponto online, trazendo mais flexibilidade para esse processo.\n' +
                              '     Nesse contexto o Clickponto apresenta-se como uma importante ferramenta capaz de tornar mais f??cil e ??gil o registro de ponto, bem como o gerenciamento das informa????es referentes a jornada de trabalho dos colaboradores e acompanhamento pelos gestores atrav??s do registro de ponto online e de f??cil acesso.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          "Objetivo",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                        Text(
                          'Seguindo uma linha de pensamento onde softwares s??ocriados com o intuito defacilitar a vida das pessoas, o Clickponto n??o ?? diferente,ele ?? uma ferramenta que faz partedo dia a dia das pessoas e por isso, buscamos melhorarum dos processos realizados por todos,beneficiando as duas partes, trabalhadores, com amobilidade da tarefa de registro de hor??rios,praticidade na metodologia para que os registros sejamrealizados, e monitoramento em temporeal dos funcion??rios por parte dos empregadores.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
