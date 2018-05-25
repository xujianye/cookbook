import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Text Field Focus',
      home: new MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyFormState();
  }
}

class _MyFormState extends State<MyForm> {

  final FocusNode myFocusNode = new FocusNode();

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              autofocus: true,
            ),
            new TextField(
              focusNode: myFocusNode,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => FocusScope.of(context).requestFocus(myFocusNode),
        tooltip: 'Focus Second Text Field',
        child: new Icon(Icons.edit),
      ),
    );
  }
}