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
  List<Todo> _todos = List.generate(
    5,
    (index) => Todo(
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(),
              settings: RouteSettings(
                arguments: {
                  "index": _todos.length,
                  "todo": Todo("", ""),
                }
              )
            )
          ).then((value) {
            setState(() {
              if (value["todo"].title != "") {
                _todos.add(value["todo"] as Todo);
              } else if (value["todo"].description != "") {
                Todo _todox = value["todo"] as Todo;
                _todox.title = _todox.description.split(" ")[0];
                _todos.add(_todox);
              }
            });
          });
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DetailState();
}

class DetailState extends State<DetailPage> {
  late Todo _todo;
  late TextEditingController _title_controller, _description_controller;
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title_controller = TextEditingController();
    _description_controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _title_controller.dispose();
    _description_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
    _todo = args["todo"];
    index = args["index"];
    _title_controller.text = _todo.title;
    _description_controller.text = _todo.description;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _todo.title = _title_controller.text;
              _todo.description = _description_controller.text;
              Navigator.of(context).pop({
                "index": index,
                "todo": _todo
              });
            },
            icon: Icon(Icons.check)
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _title_controller,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Flexible(
              child: TextField(
                maxLength: 500,
                maxLines: 15,
                controller: _description_controller,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}