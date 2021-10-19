import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: DisplayPage(),
    );
  }
}

class DisplayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DisplayState();
}

class DisplayState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DisplayBoard"),
      ),
    );
  }
}