import 'package:covidapp/models/service/userService.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../cidadao.dart';

class AddEditUser extends StatefulWidget {
  final Cidadao cidadao;
  final int index;

  const AddEditUser({Key key, this.cidadao, this.index}) : super(key: key);

  @override
  _AddEditUserState createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  TextEditingController nome = TextEditingController();
  TextEditingController fone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nasc = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController rua = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController complemento = TextEditingController();

  bool editMode = false;

  add(Cidadao cidadao) async {
    await UserService().addUser(cidadao).then((success) {
      Toast.show("Cidadão Adicionado!", context,
          gravity: Toast.CENTER, duration: 2);
      Navigator.pop(context);
    });
    //print("Cidadão Adicionado!");
  }

  update(Cidadao cidadao) async {
    await UserService().updateUser(cidadao).then((success) {
      Toast.show("Cidadão Atualizado!", context,
          gravity: Toast.CENTER, duration: 2);
      Navigator.pop(context);
    });
    //print("Cidadão Adicionado!");
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      nome.text = widget.cidadao.nome;
      fone.text = widget.cidadao.fone;
      email.text = widget.cidadao.email;
      nasc.text = widget.cidadao.nasc;
      cpf.text = widget.cidadao.cpf;
      rua.text = widget.cidadao.rua;
      numero.text = widget.cidadao.numero;
      complemento.text = widget.cidadao.complemento;
    }
  }

  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          centerTitle: true,
          title: Text(editMode ? "Atualizar" : "Cadastrar"),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: nome,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Digite o Nome',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: fone,
                      decoration: InputDecoration(
                        hintText: 'Digite o Celular',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Digite o Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: nasc,
                      decoration: InputDecoration(
                        hintText: 'Digite a Data de Nascimento',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: cpf,
                      decoration: InputDecoration(
                        hintText: 'Digite o CPF',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: rua,
                      decoration: InputDecoration(
                        hintText: 'Digite a Rua',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: numero,
                      decoration: InputDecoration(
                        hintText: 'Digite o Numero Da Sua Casa',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: complemento,
                      decoration: InputDecoration(
                        hintText: 'Digite o Complemento (somente se tiver)',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (editMode) {
                        Cidadao cidadao = Cidadao(
                          id: widget.cidadao.id,
                          nome: nome.text,
                          fone: fone.text,
                          email: email.text,
                          nasc: nasc.text,
                          cpf: cpf.text,
                          rua: rua.text,
                          numero: numero.text,
                          complemento: complemento.text,
                        );
                        update(cidadao);
                      } else {
                        if (nome.text.isEmpty) {
                          Toast.show("Esse campo é Obrigatório", context,
                              gravity: Toast.CENTER, duration: 2);
                        } else {
                          Cidadao cidadao = Cidadao(
                            nome: nome.text,
                            fone: fone.text,
                            email: email.text,
                            nasc: nasc.text,
                            cpf: cpf.text,
                            rua: rua.text,
                            numero: numero.text,
                            complemento: complemento.text,
                          );
                          add(cidadao);
                        }
                      }
                    },
                    child: Text(editMode ? "Atualizar" : "Cadastrar"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
