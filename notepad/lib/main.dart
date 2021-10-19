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
  int index;
  String title;
  String description;

  Todo(this.index, this.title, this.description);
}

class NotepadState extends State<NotepadPage> {
  List<Todo> _todos = List.generate(
    5,
    (index) => Todo(
      index,
      "Todo $index",
      "A description of what needs to be done for Todo $index"
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notepad"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_todos[index].title),
              subtitle: Text(
                _todos[index].description,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              onLongPress: () => showDialog<String>(
                context: context, 
                builder: (BuildContext context) => AlertDialog(
                  title: Text("Delete?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.pop(context, "Cancel"),
                    ),
                    TextButton(
                      child: Text("Confirm"),
                      onPressed: () {
                        setState(() {
                          _todos.removeAt(index);
                          Navigator.pop(context, "Confirm");
                        });
                      },
                    )
                  ],
                )
              )
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}