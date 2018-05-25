import 'package:flutter/material.dart';

class ValidateFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validationg Demo';

    return new MaterialApp(
      title: appTitle,
      home: new Scaffold(
        appBar: new AppBar(title: new Text(appTitle),),
        body: new MyForm(),
      ),
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
  final GlobalKey<FormState> _formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Form(
        key: _formKey,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            new Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: new RaisedButton(onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text('Processing Data')));
                }
              }, child: new Text('Submit'),),)
          ],
        )
    );
  }
}