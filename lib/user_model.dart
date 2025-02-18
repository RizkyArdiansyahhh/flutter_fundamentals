import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String? id;
  String? name;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'].toString(),
        name: "${json['first_name']} ${json['last_name']}");
  }

  static Future<User?> connectToAPi(String id) async {
    String url = "https://reqres.in/api/users/${id}";

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var object = jsonDecode(response.body);
        var objectUser = (object as Map<String, dynamic>)['data'];
        return User.fromJson(objectUser);
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
