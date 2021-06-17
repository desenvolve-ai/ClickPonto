class Usuario{

  late String id;
  late String nome;
  late String email;
  late String senha;

  Usuario(this.id,this.nome, this.email,this.senha);

  Usuario.fromJson(Map<String,dynamic>mapa,String id){
    this.id = id;
    this.nome  = mapa['nome'];
    this.email = mapa['email'];
    this.senha = mapa['senha'];
  }

  Map<String,dynamic> toJson(){
    return {
      'id' : this.id,
      'nome' : this.nome,
      'email' : this.email,
      'senha' : this.senha
    };
  }
}