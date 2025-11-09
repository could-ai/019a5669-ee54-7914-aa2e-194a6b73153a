import 'package:couldai_user_app/screens/home_page.dart';
import 'package:couldai_user_app/theme/theme.dart';
import 'package:flutter/material.dart';

class BumBrowserApp extends StatelessWidget {
  const BumBrowserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bum Browser',
      debugShowCheckedModeBanner: false,
      theme: bumBrowserTheme(),
      home: const HomePage(),
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
