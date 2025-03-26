import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key});

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[100 * ((index % 9) + 1)],
          child: Center(
            child: Text(
              items[index], // Ahora usa la lista correctamente
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        );
      },
    );
  }
}
