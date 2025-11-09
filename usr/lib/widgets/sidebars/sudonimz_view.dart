import 'package:flutter/material.dart';

class SudonimzView extends StatelessWidget {
  const SudonimzView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sudonimz", style: textTheme.headlineMedium),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columnSpacing: 20,
                columns: const [
                  DataColumn(label: Text('Label')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Action')),
                ],
                rows: List.generate(5, (index) {
                  return DataRow(
                    cells: [
                      DataCell(Text('Alias #${index + 1}')),
                      const DataCell(Text('Active')),
                      DataCell(
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            textStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          child: const Text('Rotate'),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
