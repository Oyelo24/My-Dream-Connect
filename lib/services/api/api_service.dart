import 'dart:convert';
import 'package:http/http.dart' as http;

class PocketBaseService {
  static const String baseUrl = 'http://127.0.0.1:8090';
  String? _authToken;
  
  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    if (_authToken != null) 'Authorization': _authToken!,
  };

  Future<Map<String, dynamic>> auth(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/collections/users/auth-with-password'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'identity': email, 'password': password}),
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _authToken = data['token'];
      return data;
    } else {
      throw Exception('Authentication failed');
    }
  }

  Future<Map<String, dynamic>> getRecords(String collection, {String? filter}) async {
    String url = '$baseUrl/api/collections/$collection/records';
    if (filter != null) url += '?filter=$filter';
    
    final response = await http.get(Uri.parse(url), headers: _headers);
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load records');
    }
  }

  Future<Map<String, dynamic>> createRecord(String collection, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/collections/$collection/records'),
      headers: _headers,
      body: json.encode(data),
    );
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create record');
    }
  }

  Future<Map<String, dynamic>> updateRecord(String collection, String id, Map<String, dynamic> data) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/api/collections/$collection/records/$id'),
      headers: _headers,
      body: json.encode(data),
    );
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update record');
    }
  }

  Future<void> deleteRecord(String collection, String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/collections/$collection/records/$id'),
      headers: _headers,
    );
    
    if (response.statusCode != 204) {
      throw Exception('Failed to delete record');
    }
  }
}