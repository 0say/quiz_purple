import 'package:flutter/material.dart';
import 'package:quiz_purple/src/views/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: StartPage(),
    );
  }
}
