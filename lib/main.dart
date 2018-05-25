import 'package:cookbook/forms/retrieve_the_value.dart';
import 'package:cookbook/forms/validate_form.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Cookbook'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  _startNewPage(BuildContext context, Widget widget) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => widget));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text('Create and style a text field'),
            onTap: () {
              _startNewPage(context, new RetrieveValueWidget());
            },
          ),
          new Divider(height: 1.0),

          new ListTile(
            title: new Text('Building a form with validation'),
            onTap: () {
              _startNewPage(context, new ValidateFormWidget());
            },
          ),
          new Divider(height: 1.0),

        ],
      ),
    );
  }
}

