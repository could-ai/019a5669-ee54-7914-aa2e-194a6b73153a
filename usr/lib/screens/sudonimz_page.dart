import 'package:flutter/material.dart';

class SudonimzPage extends StatelessWidget {
  const SudonimzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudonimz - Your Aliases'),
      ),
      body: Center(
        child: Text(
          'Your managed aliases will be listed here.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
