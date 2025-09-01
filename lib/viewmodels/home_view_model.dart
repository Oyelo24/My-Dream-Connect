import 'base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  String _title = 'Welcome to MDC';
  int _counter = 0;

  String get title => _title;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void updateTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }
}