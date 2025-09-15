import 'package:flutter/foundation.dart';
import '../services/api/api_service.dart';

class DataViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<dynamic> _data = [];
  bool _isLoading = false;
  String? _error;

  List<dynamic> get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }

  Future<void> fetchData(String endpoint) async {
    _setLoading(true);
    _setError(null);
    
    try {
      _data = await _apiService.getData(endpoint);
      _setLoading(false);
    } catch (e) {
      _setError(e.toString());
      _setLoading(false);
    }
  }

  Future<bool> createData(String endpoint, Map<String, dynamic> data) async {
    _setLoading(true);
    _setError(null);
    
    try {
      await _apiService.postData(endpoint, data);
      _setLoading(false);
      return true;
    } catch (e) {
      _setError(e.toString());
      _setLoading(false);
      return false;
    }
  }
}