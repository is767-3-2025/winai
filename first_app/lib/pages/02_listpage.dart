import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final List<String> entries = <String>['A', 'B', 'C','D','E','F','G','H','I','J'];
  final List<int> colorCodes = <int>[600, 200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('List Page'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 200,
            color: Colors.blue[colorCodes[index % 2]],
            child: Center(child: Text('Product ${entries[index]}')),
          );
        },
      ),
    );
  }
}
