import 'package:flutter/material.dart';
import 'create_account_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToCreateAccount();
  }

  void _navigateToCreateAccount() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag,
              size: 80,
              color: AppColors.white,
            ),
            const SizedBox(height: 20),
            Text(
              'MAD Shopping',
              style: AppTextStyles.title.copyWith(
                color: AppColors.white,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
