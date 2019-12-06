import 'package:flutter/material.dart';


/*
  RaisedButton 的属性
  ValueChanged<bool> onHighlightChanged,
  ButtonTextTheme textTheme,
  Color textColor,
  Color disabledTextColor,
  Color color,
  Color disabledColor,
  Color highlightColor,
  Color splashColor,
  Brightness colorBrightness,
  double elevation,
  double highlightElevation,
  double disabledElevation,
  EdgeInsetsGeometry padding,
  ShapeBorder shape,
  Clip clipBehavior = Clip.none,
  MaterialTapTargetSize materialTapTargetSize,
  Duration animationDuration,
  Widget child,
*/
class SecondeUseButtonStateWidget extends StatelessWidget {

  final String viewTitle;
  SecondeUseButtonStateWidget({Key key, this.viewTitle}) :super(key:key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(viewTitle),
      ),
      body: Column(
        children: <Widget>[
          new SizedBox(height: 30,),
          new RaisedButton(
            padding: const EdgeInsets.all(10),
            child: new Text("RaisedButton"),
            onPressed: () => this.back("RaisedButton"),
          ),
          new FlatButton(
            child: new Text("Flat Button"),
            onPressed: () => this.back("Flat Button"),
          ),
          new Center(
            child: new FlatButton(
              child: new Text("Button"),
              onPressed: () => this.back("Flat Button"),
            ),
          )
        ],
      ),
    );
  }
  

  void back (String str) {
    // Navigator.pop(context);
    print(str);
  }
  
}
