import 'package:flutter/material.dart';
import 'package:outfly/screens/welcome_screen.dart';
import 'package:outfly/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to OutFly',
      theme: lightMode,
      darkTheme: darkMode,
      home: const WelcomeScreen(),
    );
  }
}
