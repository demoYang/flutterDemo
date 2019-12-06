import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/animation.dart';
import 'dart:math' as math;

class MyRootWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    
    return _MyRootState();
  }
}

class _MyRootState extends State<MyRootWidget> with SingleTickerProviderStateMixin {

  AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 10), vsync: this)..repeat();
  }
  @override
  Widget build(BuildContext context) {
    return MyAnimalLogo(animation: _controller,);
  }
}

class MyAnimalLogo extends AnimatedWidget {

  MyAnimalLogo({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    print(_progress.value);
    return new Center(
      child: Transform.rotate(
        angle: _progress.value * 2.0 * math.pi,
        child: Container(
          child: FlutterLogo(size: 100,),
       ),
      )
    );
  }
}