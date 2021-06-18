import 'package:cloud_firestore/cloud_firestore.dart';

class Ponto{

  late String id;
  late String endereco;
  late Timestamp dataHora;
  late String idUsuario;

  Ponto(this.id,this.endereco, this.dataHora,this.idUsuario);

  Ponto.fromJson(Map<String,dynamic>mapa,String id){
    this.id = id;
    this.endereco  = mapa['endereco'];
    this.dataHora = mapa['dataHora'];
    this.idUsuario = mapa['idUsuario'];
  }

  Map<String,dynamic> toJson(){
    return {
      'id' : this.id,
      'endereco' : this.endereco,
      'dataHora' : this.dataHora,
      'idUsuario' : this.idUsuario
    };
  }
}