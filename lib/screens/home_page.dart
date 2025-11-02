import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../User_Data/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _handleLogout(BuildContext context) async {
    await ApiService.logout();
    
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2),
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFFB8A5C8),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _handleLogout(context),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8B4B8), Color(0xFFB8A5C8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFB8A5C8).withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(
                Icons.check_circle_outline,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Welcome to Saloon App!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B8680),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'You are successfully logged in',
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xFF8B8680).withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
