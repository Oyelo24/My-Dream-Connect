import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/auth_response_model.dart';
import '../../models/user_model.dart';

class ApiService {
  static const String baseUrl = 'https://your-api-url.com';
  String? _authToken;
  UserModel? _currentUser;

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    if (_authToken != null) 'Authorization': _authToken!,
  };

  UserModel? get currentUser => _currentUser;
  bool get isAuthenticated => _authToken != null;

  Future<AuthResponseModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final authResponse = AuthResponseModel.fromJson(
        json.decode(response.body),
      );
      _authToken = authResponse.token;
      _currentUser = authResponse.user;
      return authResponse;
    } else {
      throw Exception('Authentication failed');
    }
  }

  Future<UserModel> register(String email, String password, String name) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
        'name': name,
      }),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Registration failed');
    }
  }



  void logout() {
    _authToken = null;
    _currentUser = null;
  }

  Future<List<dynamic>> getData(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/$endpoint'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> postData(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/$endpoint'),
      headers: _headers,
      body: json.encode(data),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create data');
    }
  }

  Future<UserModel> updateProfile(Map<String, dynamic> data) async {
    if (_currentUser == null) throw Exception('Not authenticated');

    final response = await http.put(
      Uri.parse('$baseUrl/api/users/${_currentUser!.id}'),
      headers: _headers,
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      _currentUser = UserModel.fromJson(json.decode(response.body));
      return _currentUser!;
    } else {
      throw Exception('Failed to update profile');
    }
  }
}
