import 'package:flutter/material.dart';

class MyMailPage extends StatelessWidget {
  const MyMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Mail - Combined Messages'),
      ),
      body: Center(
        child: Text(
          'A combined, de-duplicated mail feed from all your aliases will be shown here.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
