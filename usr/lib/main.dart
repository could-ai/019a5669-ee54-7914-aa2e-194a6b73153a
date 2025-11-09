import 'package:bum_browser_prototype/screens/home_screen.dart';
import 'package:bum_browser_prototype/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bum Browser',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.bumBrowserTheme,
      home: const HomeScreen(),
    );
  }
}
