import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/paramedic_screen.dart';

void main() {
  runApp(const AsafniApp());
}

class AsafniApp extends StatelessWidget {
  const AsafniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asafni - أسعفني',
      theme: ThemeData(
        primaryColor: const Color(0xFF2196F3),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
          primary: const Color(0xFF2196F3),
          secondary: const Color(0xFF4CAF50),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/paramedic': (context) => const ParamedicScreen(),
      },
    );
  }
}
