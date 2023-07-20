// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_key.dart';

class ApiClient {
  static Future<dynamic> get(String path,
      {Map<String, String>? headers}) async {
    try {
      print("$baseUrl$path&apiKey=$apiKey");
      dynamic response = await http
          .get(Uri.parse('$baseUrl$path&apiKey=$apiKey'), headers: headers);

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        var decodedJson = jsonDecode(response.body);
        throw Exception('Failed to load data: ${decodedJson["code"]}');
      }
    } catch (e) {
      if (e.toString().contains("rateLimited")) {
        apiKey = alterNateApiKey;
      }
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
