import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CounterState();
}

class CounterState extends State<CounterPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "$_count",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Row(
              children: <Widget>[
                Spacer(),
                ElevatedButton(
                  child: Text("+1"),
                  onPressed: _countplus,
                ),
                Spacer(),
                ElevatedButton(
                  child: Text("Zero"),
                  onPressed: _countzero,
                ),
                Spacer(),
                ElevatedButton(
                  child: Text("-1"),
                  onPressed: _countminus,
                ),
                Spacer()
              ],
            )
          ], 
        ), 
      )
    );
  }

  void _countplus() {
    setState(() {
      _count++;
    });
  }

  void _countminus() {
    setState(() {
      _count--;
    });
  }

  void _countzero() {
    setState(() {
      _count = 0;
    });
  }

}