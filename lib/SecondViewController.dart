import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SecondScreen extends StatelessWidget {

  final String viewTitle;

  SecondScreen({Key key ,@required this.viewTitle}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(viewTitle),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Go back!'),
          onPressed: () {
            print(context);
            Navigator.pop(context);
          }//=> Navigator.pop(context),
        ),
      ),
    );
  }
}