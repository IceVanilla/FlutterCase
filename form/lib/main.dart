import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormState();
}

class FormState extends State<FormPage> {
  String _phone_type = "mobile";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Icon(
                  Icons.face,
                  color: Colors.white,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Name"
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.white,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Phone number"
                            ),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 3,
                          child: DropdownButton<String>(
                            value: _phone_type,
                            onChanged: (String? value) {
                              setState(() {
                                _phone_type = value.toString();
                              });
                            },
                            items: <DropdownMenuItem<String>>[
                              DropdownMenuItem(
                                value: "mobile",
                                child: Text("mobile"),
                              ),
                              DropdownMenuItem(
                                value: "home",
                                child: Text("home"),
                              ),
                              DropdownMenuItem(
                                value: "work",
                                child: Text("work"),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ),
            Center(
              child: Text("Setting"),
            ),
          ],
        ),
      ),
    );
  }
}