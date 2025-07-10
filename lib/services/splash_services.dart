import 'package:flutter/material.dart';

class SplashServices {
  void navigateToHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }


}