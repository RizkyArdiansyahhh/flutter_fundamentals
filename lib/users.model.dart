import 'dart:convert';

import 'package:http/http.dart' as http;

class Users {
  int? id;
  String? name;
  String? linkImage;

  Users({this.id, this.name, this.linkImage});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: "${json['first_name']} ${json['last_name']}",
      linkImage: json['avatar'],
    );
  }

  static Future<List<Users>?> getUsers(int page) async {
    String urlAPI = "https://reqres.in/api/users?page=$page";

    try {
      var response = await http.get(Uri.parse(urlAPI));

      if (response.statusCode == 200) {
        var object = jsonDecode(response.body);
        var objectUsers = (object as Map<String, dynamic>)['data'];
        return (objectUsers as List).map((e) => Users.fromJson(e)).toList();
      } else {
        print("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception $e");
      return null;
    }
  }
}
