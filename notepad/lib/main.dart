import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: NotepadPage()
    );
  }
}

class NotepadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotepadState();
}

class Todo {
  String title;
  String description;

  Todo(this.title, this.description);
}

class NotepadState extends State<NotepadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notepad"),
      ),
    );
  }
}