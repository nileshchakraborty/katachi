import 'package:flutter_web/material.dart';

import 'code.dart';
import 'p5.dart';
import 'sketch.dart';

void main() => runApp(MyApp());

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katachi',
      theme: ThemeData(primaryColor: Colors.black),
      home: const MyHomePage(title: 'Katachi'),
    );
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  MySketch _sketch;
  PAnimator _animator;
  TextEditingController _textController;
  String _text = '''
background(color(255, 255, 255));
noFill();
stroke(color(0, 255, 0));
strokeWeight(2);
ellipse(150, 150, 100, 100);
noStroke();
fill(color(200, 200, 200));
rect(200, 200, 50, 50);
''';

  @override
  void initState() {
    super.initState();
    _sketch = MySketch(codes: <PCode>[]);
    // Need an animator to call the draw() method in the sketch continuously,
    // otherwise it will be called only when touch events are detected.
    _animator = PAnimator(this);
    _animator.addListener(() {
      setState(() {
        _sketch.redraw();
      });
    });
    _animator.run();

    _textController = TextEditingController(text: _text);

    _parse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('P5 Draw!')),
      backgroundColor: const Color.fromRGBO(200, 200, 200, 1.0),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: TextField(
                controller: _textController,
                maxLines: null,
                
                onChanged: (String value) {
                  setState(() {
                    _text = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: PWidget(painter: _sketch),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _parse,
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _parse() {
    final List<String> lines = _text
        .split(RegExp(r';\s*'))
        .where((String line) => line.isNotEmpty)
        .toList();
    setState(() {
      _sketch =
          MySketch(codes: lines.map((String line) => PCode(line)).toList());
    });
  }
}
