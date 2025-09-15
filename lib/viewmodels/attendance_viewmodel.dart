import 'base_viewmodel.dart';

class AttendanceViewModel extends BaseViewModel {
  double _attendanceRate = 0.84;
  int _present = 21;
  int _late = 1;
  int _absent = 3;

  double get attendanceRate => _attendanceRate;
  int get present => _present;
  int get late => _late;
  int get absent => _absent;

  Future<void> markPresent() async {
    setLoading(true);
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    _present++;
    _attendanceRate = _present / (_present + _late + _absent);
    setLoading(false);
  }
}