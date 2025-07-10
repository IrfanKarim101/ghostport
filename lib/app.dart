import 'package:flutter/material.dart';
import 'package:ghostport/screens/home_screen.dart';
import 'package:ghostport/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GhostPort',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(),
      ),
      home: const SplashScreen(),
      initialRoute: '/',
      routes: {'/home': (context) => const HomeScreen()},
      debugShowCheckedModeBanner: false,
    );
  }
}
