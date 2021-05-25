import 'package:covidapp/models/cidadao.dart';
import 'package:covidapp/models/service/addEditUser.dart';
import 'package:covidapp/models/service/userService.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Cidadao> cidadaoList;

  bool loading = true;

  getAllCidadao() async {
    cidadaoList = await UserService().getUser();
    setState(() {
      loading = false;
    });
    print("user : ${cidadaoList.length}");
  }

  delete(Cidadao cidadao) async {
    await UserService().deleteUser(cidadao);
    setState(() {
      loading = false;
      getAllCidadao();
    });
    Toast.show("Cidadão Deletado!", context,
        gravity: Toast.CENTER, duration: 2);
  }

  @override
  void initState() {
    super.initState();
    getAllCidadao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Cidadãos'),
        actions: <Widget>[
          IconButton(
            
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditUser(),
                ),
              ).then((value) => getAllCidadao());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: cidadaoList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, i) {
                  Cidadao cidadao = cidadaoList[i];
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddEditUser(cidadao: cidadao, index: i),
                        ),
                      ).then((value) => getAllCidadao());
                    },
                    
                    leading: CircleAvatar(
                      child: Text(cidadao.nome[0]),
                    ),
                    title: Text(cidadao.nome),
                    subtitle: Text(cidadao.cpf),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Excluir Cidadão'),
                              content: Text('Tem ceteza?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Não'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                ),
                                TextButton(
                                  child: Text('Sim'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                ),
                              ],
                            ),
                          ).then((confirmed) {
                            if (confirmed) {
                              delete(cidadao);
                            }
                          });
                        }),
                  );
                }),
        
        ),
      
    );
  }
}
