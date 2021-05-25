import 'dart:convert';

import '../cidadao.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const ADD_URL = 'https://192.168.0.111/ProjetoCovid/add.php';
  static const VIEW_URL = 'https://192.168.0.111/ProjetoCovid/view.php';
  static const UPDATE_URL = 'https://192.168.0.111/ProjetoCovid/update.php';
  static const DELETE_URL = 'https://192.168.0.111/ProjetoCovid/delete.php';

  Future<String> addUser(Cidadao cidadao) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: cidadao.toJsonAdd());
    if (response.statusCode == 200) {
      print("Add Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

List<Cidadao> cidadaoFromJson(String jsonString){
final data = json.decode(jsonString);
return List<Cidadao>.from(data.map((item)=>Cidadao.fromjson(item)));
}

  Future<List<Cidadao>> getUser()async{
final response = await http.get(Uri.parse(VIEW_URL));
if (response.statusCode == 200){
List<Cidadao> list = cidadaoFromJson(response.body);
return list;
}else {
 return <Cidadao>[];
}
  }
  Future<String> updateUser(Cidadao cidadao) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: cidadao.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Update Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
  Future<String> deleteUser(Cidadao cidadao) async {
    final response =
        await http.post(Uri.parse(DELETE_URL), body: cidadao.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
}
