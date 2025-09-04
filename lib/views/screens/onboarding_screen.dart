import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentQuestion = 0;
  Map<int, String> answers = {};

  // Mock data - replace with API call
  final List<Map<String, dynamic>> questions = [
    {
      'question': "What's your educational background?",
      'subtitle': 'Choose the option that best describes you',
      'options': [
        'High School Graduate',
        'Some College',
        "Bachelor's Degree",
        "Master's Degree",
        'Other'
      ]
    },
    {
      'question': "What's your career goal?",
      'subtitle': 'Select your primary objective',
      'options': [
        'Career Change',
        'Skill Enhancement',
        'First Job',
        'Promotion',
        'Entrepreneurship'
      ]
    },
    {
      'question': "What's your experience level?",
      'subtitle': 'Choose your current level',
      'options': [
        'Complete Beginner',
        'Some Experience',
        'Intermediate',
        'Advanced',
        'Expert'
      ]
    },
    {
      'question': "What's your preferred learning style?",
      'subtitle': 'How do you learn best?',
      'options': [
        'Visual Learning',
        'Hands-on Practice',
        'Reading/Research',
        'Group Discussion',
        'One-on-One Mentoring'
      ]
    }
  ];

  void _selectOption(String option) {
    setState(() {
      answers[currentQuestion] = option;
    });
  }

  void _nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      // Complete onboarding
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void _previousQuestion() {
    if (currentQuestion > 0) {
      setState(() {
        currentQuestion--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress = (currentQuestion + 1) / questions.length;
    final progressPercent = (progress * 100).round();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Title
              const Center(
                child: Text(
                  "Let's Get to Know You",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Help us personalize your bootcamp experience',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${currentQuestion + 1} of ${questions.length}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '$progressPercent%',
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
              ),
              const SizedBox(height: 40),
              // Question
              Text(
                question['question'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                question['subtitle'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              // Options
              Expanded(
                child: ListView.builder(
                  itemCount: question['options'].length,
                  itemBuilder: (context, index) {
                    final option = question['options'][index];
                    final isSelected = answers[currentQuestion] == option;
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: GestureDetector(
                        onTap: () => _selectOption(option),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected ? const Color(0xFF4A90E2) : Colors.grey[300]!,
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: isSelected ? const Color(0xFF4A90E2).withOpacity(0.1) : Colors.white,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? const Color(0xFF4A90E2) : Colors.grey[400]!,
                                    width: 2,
                                  ),
                                  color: isSelected ? const Color(0xFF4A90E2) : Colors.white,
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.circle,
                                        size: 12,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                option,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected ? const Color(0xFF4A90E2) : Colors.black87,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Navigation buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentQuestion > 0)
                    TextButton.icon(
                      onPressed: _previousQuestion,
                      icon: const Icon(Icons.arrow_back, color: Colors.grey),
                      label: const Text(
                        'Back',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  else
                    const SizedBox(),
                  ElevatedButton.icon(
                    onPressed: answers[currentQuestion] != null ? _nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                    label: Text(
                      currentQuestion == questions.length - 1 ? 'Complete' : 'Next',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}