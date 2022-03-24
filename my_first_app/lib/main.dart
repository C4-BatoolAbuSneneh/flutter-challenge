import 'package:flutter/material.dart';
import 'package:my_first_app/Analyzer.dart';

import 'algorithim.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sorting App',
    home: Sort(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorting App'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Visual()),
            );
          },

          
        ),
      ),
    );
  }
}
