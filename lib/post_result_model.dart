import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  String? jsonrpc;
  String? result;
  int? id;

  PostResult({
    this.jsonrpc,
    this.result,
    this.id,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      jsonrpc: object['jsonrpc'],
      result: object['result'], // FIXED: seharusnya "result", bukan "method"
      id: object['id'],
    );
  }

  static Future<PostResult?> connectToApi(String jsonrpc, String method,
      Map<String, dynamic> params, int id) async {
    String apiUrl = "http://192.168.50.187/zabbix/api_jsonrpc.php";

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type":
              "application/json-rpc", // FIXED: gunakan content-type yang sesuai
        },
        body: jsonEncode({
          // FIXED: harus menggunakan jsonEncode()
          "jsonrpc": jsonrpc,
          "method": method,
          "params": params,
          "id": id,
        }),
      );

      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.body);
        return PostResult.createPostResult(jsonObject);
      } else {
        print("Error: ${response.statusCode}, ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
