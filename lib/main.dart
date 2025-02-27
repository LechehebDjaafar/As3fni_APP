import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/welcome_screen.dart';
import 'providers/app_provider.dart';
import 'screens/paramedic/paramedic_home.dart';
import 'screens/patient/patient_main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: const AsafniApp(),
    ),
  );
}

class AsafniApp extends StatelessWidget {
  const AsafniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asafni - أسعفني',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/patient_home': (context) => const PatientMain(),
        '/paramedic_home': (context) => const ParamedicHome(),
      },
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
