import 'package:bum_browser_prototype/widgets/bum_prompt_dialog.dart';
import 'package:bum_browser_prototype/widgets/sidebars/main_sidebar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showBumPrompt(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const BumPromptDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bum Browser'),
      ),
      body: const Row(
        children: [
          MainSidebar(),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Select a category from the sidebar to manage your aliases, mail, and scraps.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBumPrompt(context),
        tooltip: 'Bum this Website',
        child: const Icon(Icons.shield_outlined),
      ),
    );
  }
}
