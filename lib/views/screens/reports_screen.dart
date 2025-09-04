import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Performance Reports',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Track your learning progress and achievements',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            
            // Performance Cards
            Row(
              children: [
                Expanded(
                  child: _buildPerformanceCard('A-', 'Grade', const Color(0xFF4A90E2)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildPerformanceCard('84%', 'Attendance', Colors.green),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildPerformanceCard('80%', 'Progress', Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Recent Scores
            Row(
              children: [
                Icon(Icons.trending_up, color: Colors.blue[600], size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Recent Scores',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Your latest assessment results',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildScoreItem('JavaScript Fundamentals', 'Dec 10, 2024', '95%', Colors.green),
            _buildScoreItem('HTML & CSS Mastery', 'Dec 8, 2024', '88%', const Color(0xFF4A90E2)),
            _buildScoreItem('Web Design Principles', 'Dec 5, 2024', '92%', Colors.green),
            _buildScoreItem('Programming Logic', 'Dec 3, 2024', '78%', const Color(0xFF4A90E2)),
            _buildScoreItem('Introduction to Web Dev', 'Dec 1, 2024', '85%', const Color(0xFF4A90E2)),
            
            const SizedBox(height: 32),
            
            // Skill Development
            Row(
              children: [
                Icon(Icons.trending_up, color: Colors.blue[600], size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Skill Development',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Your progress in different skill areas',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildSkillProgress('JavaScript', 0.85, 'Advanced'),
            _buildSkillProgress('HTML/CSS', 0.90, 'Expert'),
            _buildSkillProgress('React', 0.65, 'Intermediate'),
            _buildSkillProgress('Version Control', 0.75, 'Intermediate'),
            _buildSkillProgress('Problem Solving', 0.80, 'Advanced'),
            
            const SizedBox(height: 32),
            
            // Monthly Trends
            const Text(
              'Monthly Trends',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your performance over the past months',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildMonthlyTrend('November 2024', 'Attendance: 90%', 'Avg Score: 82%'),
            _buildMonthlyTrend('December 2024', 'Attendance: 85%', 'Avg Score: 88%'),
            
            const SizedBox(height: 32),
            
            // Achievement Unlocked
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Icon(Icons.emoji_events, color: Colors.white, size: 32),
                  SizedBox(height: 8),
                  Text(
                    'Achievement Unlocked!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Completed 80% of all assessments with excellent scores',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceCard(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreItem(String title, String date, String score, Color scoreColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                score,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: scoreColor,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.check_circle,
                color: scoreColor,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillProgress(String skill, double progress, String level) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                level,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4A90E2)),
            minHeight: 8,
          ),
          const SizedBox(height: 4),
          Text(
            '${(progress * 100).round()}%',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyTrend(String month, String attendance, String avgScore) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            month,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                attendance,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                avgScore,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}