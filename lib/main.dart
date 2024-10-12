import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Necessário para WebView
  runApp(const MaterialApp(
    home: MainScreen(),
  ));
}
