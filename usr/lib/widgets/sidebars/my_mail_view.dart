import 'package:flutter/material.dart';

class MyMailView extends StatelessWidget {
  const MyMailView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("My Mail", style: textTheme.headlineMedium),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 5, // Mock data
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text('Trial Confirmation #${index + 1}', style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  'From: service@website.com\nYour trial has begun. It will expire on Dec 25, 1888.',
                  style: textTheme.bodyMedium,
                ),
                isThreeLine: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
