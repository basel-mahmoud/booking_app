import 'package:flutter/material.dart';
import 'User_Data/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saloon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB8A5C8), // Lavender
          primary: const Color(0xFFB8A5C8),
          secondary: const Color(0xFFE8B4B8), // Blush Pink
        ),
        scaffoldBackgroundColor: const Color(0xFFFAF7F2), // Cream
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}


