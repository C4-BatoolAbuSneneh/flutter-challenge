import 'package:flutter/material.dart';
import 'algorithim.dart';

/*flutter => framework and tools to craete application in ios and windows and desktop
Widget => you compose your by boding widget together
*/

// The runApp() function takes the given Widget and makes it the root of the widget tree
void main() {
  runApp(const MaterialApp(
    title: 'Sorting App',
    home: Sort(),
  ));
}

/*The text direction needs to be specified in this instance; 
when the MaterialApp widget is used, this is taken care of for you,
 as demonstrated later.*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sorting Algorithm Analyzer',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Sorting Algorithm Analyzer'),
           
          ),
        ));
  }
}

