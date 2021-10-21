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
  bool _notification = false;
  double _volume = 50;
  bool _storage = true, _location = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
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
            SingleChildScrollView(
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
                  ),
                  Divider(
                      height: 10,
                      color: Colors.white,
                  ),
                  TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Address",
                      ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Notification"),
                    trailing: Switch(
                      value: this._notification,
                      activeColor: Colors.blue,
                      onChanged: (bool val) {
                          this.setState(() {
                            this._notification = val;
                          }
                        );
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Volume"),
                    subtitle: Slider(
                      value: _volume,
                      min: 0,
                      max: 100,
                      divisions: 20,
                      label: _volume.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _volume = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Permission"),
                    subtitle: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Storage"),
                          leading: Checkbox(
                            value: _storage,
                            onChanged: (bool? value) {
                              setState(() {
                                _storage = value as bool;
                              });
                            }
                          )
                        ),
                        ListTile(
                          title: Text("Location"),
                          leading: Checkbox(
                            value: _location,
                            onChanged: (bool? value) {
                              setState(() {
                                _location = value as bool;
                              });
                            }
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}