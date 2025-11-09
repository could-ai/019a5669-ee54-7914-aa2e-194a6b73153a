import 'package:flutter/material.dart';

class ScrapzPage extends StatelessWidget {
  const ScrapzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrapz - Saved Projects & Captures'),
      ),
      body: Center(
        child: Text(
          'Your captured projects and files will appear here.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
