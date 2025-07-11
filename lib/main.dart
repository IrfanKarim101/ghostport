import 'package:flutter/material.dart';
import 'package:ghostport/app.dart';
import 'package:ghostport/services/theme_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const App(),
  ));
}
