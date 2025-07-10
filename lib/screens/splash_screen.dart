import 'package:flutter/material.dart';
import 'package:ghostport/services/splash_services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void initState() {
      // Navigate to home after a delay
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SplashServices().navigateToHome(context);
      });
    }

    initState();
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GhostPort',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Your Port Scanning Companion",
              style: TextStyle(fontSize: 11, color: Colors.white70),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
