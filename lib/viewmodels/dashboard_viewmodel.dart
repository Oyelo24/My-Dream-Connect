import 'package:flutter/foundation.dart';
import 'base_viewmodel.dart';

class DashboardViewModel extends BaseViewModel {
  String _userName = '';
  double _attendance = 0.0;
  String _overallGrade = '';
  int _completedAssessments = 0;
  int _totalAssessments = 0;
  List<Map<String, String>> _upcomingAssessments = [];
  List<Map<String, dynamic>> _recentActivity = [];

  String get userName => _userName;
  double get attendance => _attendance;
  String get overallGrade => _overallGrade;
  int get completedAssessments => _completedAssessments;
  int get totalAssessments => _totalAssessments;
  double get assessmentProgress => _totalAssessments > 0 ? _completedAssessments / _totalAssessments : 0.0;
  List<Map<String, String>> get upcomingAssessments => _upcomingAssessments;
  List<Map<String, dynamic>> get recentActivity => _recentActivity;

  Future<void> loadDashboardData() async {
    setLoading(true);
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      _userName = 'Alex Johnson'; // This should come from user.fullName in real app
      _attendance = 0.85;
      _overallGrade = 'A-';
      _completedAssessments = 12;
      _totalAssessments = 15;
      
      _upcomingAssessments = [
        {'title': 'JavaScript Fundamentals', 'date': 'Tomorrow', 'type': 'Quiz'},
        {'title': 'React Components', 'date': 'Dec 15', 'type': 'Project'},
      ];
      
      _recentActivity = [
        {'title': 'Completed HTML/CSS Assessment', 'time': '2 days ago', 'score': '95%'},
        {'title': 'Attended Web Development Workshop', 'time': '5 days ago', 'score': null},
        {'title': 'Submitted Portfolio Project', 'time': '1 week ago', 'score': '88%'},
      ];
      
      setLoading(false);
    } catch (e) {
      setError('Failed to load dashboard data');
      setLoading(false);
    }
  }
}