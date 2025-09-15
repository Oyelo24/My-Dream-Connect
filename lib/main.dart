import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/app_routes.dart';
import 'utils/app_theme.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/data_viewmodel.dart';
import 'viewmodels/dashboard_viewmodel.dart';
import 'viewmodels/attendance_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => DataViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => AttendanceViewModel()),
      ],
      child: MaterialApp(
        title: 'MDC',
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.login,
        routes: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// Backend Configuration:

// Set up PocketBase server with proper collections

// Configure authentication endpoints

// Set up data models for students, attendance, assessments



// State Management Enhancement:

// Complete ViewModels for all screens

// Add proper error handling

// Implement loading states



// Security & Production:

// Environment variables for API URLs

// Proper error handling and validation

// Offline capability with local storage

// Push notifications setup



// Assets:

// App icons and splash screen images

// Placeholder images for profiles

// Loading animations