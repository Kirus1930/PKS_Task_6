import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // show logo then navigate
    Future.delayed(const Duration(milliseconds: 700), () {
      Navigator.of(context).pushReplacementNamed('/create');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Use background color from Figma if specified
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- FIGMA ASSET MARKER ---
            // Replace 'assets/images/logo.png' with the exported logo from Figma
            Image.asset('assets/images/logo.png', width: 160, height: 160),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
