import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String? jsonrpc;
  String? result;
  int? id;

  PostResult({this.jsonrpc, this.result, this.id});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      jsonrpc: object['jsonrpc'],
      result: object['result'],
      id: object['id'],
    );
  }

  static Future<PostResult?> connectToApi(String jsonrpc, String method,
      Map<String, dynamic> params, int id) async {
    String url = "http://192.168.50.193/zabbix/api_jsonrpc.php";

    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "jsonrpc": jsonrpc,
            "method": method,
            "params": params,
            "id": id,
          }));

      if (response.statusCode == 200) {
        var object = jsonDecode(response.body);
        return PostResult.createPostResult(object);
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
