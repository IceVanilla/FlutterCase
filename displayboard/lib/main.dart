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
  final List<String> _content = [
    "Once when I was six years old I saw a magnificent picture in a book, called True Stories from Nature, about the primeval forest. It was a picture of a boa constrictor in the act of swallowing an animal. Here is a copy of the drawing.",
    "In the book it said: \"Boa constrictors swallow their prey whole, without chewing it. After that they are not able to move, and they sleep through the six months that they need for digestion.\"",
    "I pondered deeply, then, over the adventures of the jungle. And after some work with a colored pencil I succeeded in making my first drawing. My Drawing Number One. It looked like this:",
    "I showed my masterpiece to the grown-ups, and asked them whether the drawing frightened them.",
    "But they answered: \"Frighten? Why should any one be frightened by a hat?\"",
    "My drawing was not a picture of a hat. It was a picture of a boa constrictor digesting an elephant. But since the grown-ups were not able to understand it, I made another drawing: I drew the inside of the boa constrictor, so that the grown-ups could see it clearly. They always need to have things explained.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DisplayBoard"),
      ),
      body: displaylist(),
    );
  }

  Widget displaylist() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _content.length,
      itemBuilder: (BuildContext _context, int index) {
        return Container(
          height: 150,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          padding: const EdgeInsets.all(8),
          child: Text(
            _content[index],
            style: const TextStyle(
              fontSize: 16
            ),
          ),
          color: Colors.blue[(index + 1) * 100],
        );
      },
    );
  }

  Widget displaygrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _content.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.8,
      ), 
      itemBuilder: (BuildContext _context, int index) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text(_content[index]),
          color: Colors.blue[(index + 1) * 100],
        );
      }
    );
  }

}