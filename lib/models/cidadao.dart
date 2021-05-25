class Cidadao {
  String id;
  String nome;
  String fone;
  String email;
  String nasc;
  String cpf;
  String rua;
  String numero;
  String complemento;

  Cidadao(
      {this.id,
      this.nome,
      this.fone,
      this.complemento,
      this.email,
      this.cpf,
      this.nasc,
      this.numero,
      this.rua});

  factory Cidadao.fromjson(Map<String, dynamic> json) {
    return Cidadao(
      id: json['id'] as String,
      nome: json['nome'] as String,
      fone: json['fone'] as String,
      email: json['email'] as String,
      nasc: json['nasc'] as String,
      cpf: json['cpf'] as String,
      rua: json['rua'] as String,
      numero: json['numero'] as String,
      complemento: json['complemento'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "nome": nome,
      "fone": fone,
      "email": email,
      "nasc": nasc,
      "cpf": cpf,
      "rua": rua,
      "numero": numero,
      "complemento": complemento,
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id": id,
      "nome": nome,
      "fone": fone,
      "email": email,
      "nasc": nasc,
      "cpf": cpf,
      "rua": rua,
      "numero": numero,
      "complemento": complemento,
    };
  }
}
