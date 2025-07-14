import 'package:flutter/material.dart';
import 'package:ghostport/screens/scan_screen.dart';
import 'package:provider/provider.dart';
import 'package:ghostport/screens/home_screen.dart';
import 'package:ghostport/screens/splash_screen.dart';
import 'package:ghostport/services/theme_services.dart';
import 'package:ghostport/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'GhostPort',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreen(),
          initialRoute: '/',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/scan':
                (context) =>
                    const ScanScreen(target: '', options: '', result: ''),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
