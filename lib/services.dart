import 'package:dio/dio.dart';

import 'person.dart';

abstract class Services {
  static Future<Person?> getById(int id) async {
    try {
      var response = await Dio().get("https://reqres.in/api/users/$id");

      if (response.statusCode == 200) {
        return Person(
            id: response.data['data']['id'],
            name:
                "${response.data['data']['first_name']} ${response.data['data']['last_name']}",
            email: response.data['data']['email']);
      } else {
        print("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Person?> createUser(
      String firstName, String lastName, String email) async {
    try {
      var response = await Dio().post("https://reqres.in/api/users", data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
      });

      if (response.statusCode == 201) {
        return Person(
          id: int.parse(response.data['id'].toString()),
          name: "${response.data['first_name']} ${response.data['last_name']}",
          email: response.data['email'],
        );
      } else {
        print("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
