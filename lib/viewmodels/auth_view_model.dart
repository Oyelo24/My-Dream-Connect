import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api/api_service.dart';
import '../services/local/storage_service.dart';

class AuthViewModel extends ChangeNotifier {
  final PocketBaseService _apiService = PocketBaseService();
  
  UserModel? _currentUser;
  bool _isLoading = false;
  String? _error;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _currentUser != null;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    try {
      _setLoading(true);
      _setError(null);
      
      final authResponse = await _apiService.auth(email, password);
      _currentUser = authResponse.record;
      
      await StorageService.saveAuthToken(authResponse.token);
      await StorageService.saveUser(_currentUser!);
      
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> register(String email, String password, String name) async {
    try {
      _setLoading(true);
      _setError(null);
      
      await _apiService.register(email, password, name);
      await _apiService.requestVerification(email);
      
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> verifyEmail(String token) async {
    try {
      _setLoading(true);
      _setError(null);
      
      await _apiService.confirmVerification(token);
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _apiService.logout();
    _currentUser = null;
    await StorageService.clearAll();
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    final token = await StorageService.getAuthToken();
    final user = await StorageService.getUser();
    
    if (token != null && user != null) {
      _currentUser = user;
      notifyListeners();
    }
  }
}