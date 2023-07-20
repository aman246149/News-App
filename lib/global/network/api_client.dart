import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_key.dart';

class ApiClient {
  static Future<dynamic> get(String path,
      {Map<String, String>? headers}) async {
    try {
      print("$baseUrl$path&apiKey=$apiKey");
      final response = await http.get(Uri.parse('$baseUrl$path&apiKey=$apiKey'),
          headers: headers);

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make the GET request: $e');
    }
  }

  static Future<dynamic> post(String path,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl$path'),
          headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make the POST request: $e');
    }
  }
}
