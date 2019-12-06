

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_word/Base/WidgetProtocol.dart';

class WidgetStateGuide extends StatelessWidget implements WidgetProtocol{

  String title;
  
  final GlobalKey <NumberWidgetTwoState> countkey = GlobalKey();

  final StreamController<int> _countStream = StreamController();

  int clickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top : 20.0),
            alignment: Alignment.center,      
            height: 100,
            child: Column(
              children: <Widget>[
                Text('通过Set State 管理状态'),
                DemoOne(),
              ],
            ),
          )
        ],
      )
      );
  }

  @override
  void setupParamDict(Map dict) {
    title = dict["title"];
  }
}

// class DemoTwo extends StatefulWidget {

//   @override
//   _DemoTwoState createState() => _DemoTwoState();
// }
// class _DemoTwoState extends State<DemoTwo> {

  

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Text('通过 Global Key 管理'),
//         ],
//       ),
//     );
//   }
// }

class DemoTwo extends StatefulWidget {

}



//通过 setState 管理状态
class DemoOne extends StatefulWidget {

  @override 
  _DemoOneState createState()=> _DemoOneState();
}

class _DemoOneState extends State<DemoOne> {
  int clickCount = 0;
  Widget build(BuildContext context) {   
    return FlatButton(
      child: Text('点击次数 : $clickCount'),
      onPressed: () {
        setState(() {
          clickCount = clickCount + 1;
        });
      },
    );
  }
}






class NumberWidgetTwo extends StatefulWidget {

  NumberWidgetTwo({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    
    return NumberWidgetTwoState();
  }
  
}
class NumberWidgetTwoState extends State<NumberWidgetTwo>{

  int count = 0;
  @override
  Widget build(BuildContext context) {
    
    return Text('count : $count');
  }

  void changeNumber(int n){
    setState(() {
      count = count + n;
    });
  }
}


class NumberWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NumberWidgetState();
  }

  NumberWidget({Key key}):super(key:key);
}

class NumberWidgetState extends State<NumberWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      child: Center(
        child: Text('点击次数: $count'),
      ),
      onTap: (){
        setState(() {
          count = count +  1;          
        });
      },
    );
  }
}