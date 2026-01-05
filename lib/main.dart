import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FarmCartApp());
}

class FarmCartApp extends StatelessWidget {
  const FarmCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmCart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

