import 'package:flutter/material.dart';

class RetrieveValueWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Retrieve Text Input',
      home: new MyForm(),
    );
  }
}

//Define a Custom Form Widget
class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyFormState();
  }
}

// Define a corresponding State class. This class will hold the data related to our Form.
class _MyFormState extends State<MyForm> {
  // Create a text controller. We will use it to retrieve the current value of the TextField!
  final myController = new TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.removeListener(_printLatestValue);
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Retrieve Text Input'),),
      body: new Padding(padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new TextField(onChanged: (text) {
              print('First text field: $text');
            },),
            new TextField(controller: myController,),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          return showDialog(context: context, builder: (context) {
            return new AlertDialog(content: new Text(myController.text),);
          });
        },
        tooltip: 'Show me the value!',
        child: new Icon(Icons.text_fields),
      ),
    );
  }
}