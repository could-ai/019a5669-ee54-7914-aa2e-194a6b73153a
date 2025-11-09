import 'package:flutter/material.dart';

class ScrapzView extends StatelessWidget {
  const ScrapzView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Scrapz", style: textTheme.headlineMedium),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search scraps...',
              prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: 5, // Mock data
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.image_outlined),
                  title: Text('Project Asset ${index + 1}', style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                  subtitle: Text('photoshop-references.psd\nCaptured: 18 Nov, 1888', style: textTheme.bodyMedium),
                  isThreeLine: true,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
