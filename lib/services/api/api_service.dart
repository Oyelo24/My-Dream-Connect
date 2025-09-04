import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/auth_response_model.dart';
import '../../models/user_model.dart';

class PocketBaseService {
  static const String baseUrl = 'http://127.0.0.1:8090';
  String? _authToken;
  UserModel? _currentUser;

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    if (_authToken != null) 'Authorization': _authToken!,
  };

  UserModel? get currentUser => _currentUser;
  bool get isAuthenticated => _authToken != null;

  Future<AuthResponseModel> auth(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/collections/users/auth-with-password'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'identity': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final authResponse = AuthResponseModel.fromJson(
        json.decode(response.body),
      );
      _authToken = authResponse.token;
      _currentUser = authResponse.record;
      return authResponse;
    } else {
      throw Exception('Authentication failed');
    }
  }

  Future<UserModel> register(String email, String password, String name) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/collections/users/records'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
        'passwordConfirm': password,
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Registration failed');
    }
  }

  Future<void> requestVerification(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/collections/users/request-verification'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to send verification email');
    }
  }

  Future<void> confirmVerification(String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/collections/users/confirm-verification'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'token': token}),
    );

    if (response.statusCode != 204) {
      throw Exception('Email verification failed');
    }
  }

  void logout() {
    _authToken = null;
    _currentUser = null;
  }

  Future<Map<String, dynamic>> getRecords(
    String collection, {
    String? filter,
  }) async {
    String url = '$baseUrl/api/collections/$collection/records';
    if (filter != null) url += '?filter=$filter';

    final response = await http.get(Uri.parse(url), headers: _headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load records');
    }
  }

  Future<Map<String, dynamic>> createRecord(
    String collection,
    Map<String, dynamic> data,
  ) async {
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

  Future<UserModel> updateProfile(Map<String, dynamic> data) async {
    if (_currentUser == null) throw Exception('Not authenticated');

    final response = await http.patch(
      Uri.parse('$baseUrl/api/collections/users/records/${_currentUser!.id}'),
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
