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
              child: Text("Information"),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Text("Setting"),
            ),
          ],
        ),
      ),
    );
  }
}