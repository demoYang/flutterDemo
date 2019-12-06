// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailView.dart';
import 'package:hello_word/PageRoute/CustomPageRoute.dart';
import '../Base/WidgetProtocol.dart';



Widget navGuideListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      GestureDetector(
        child: Container(
          
          margin: const EdgeInsets.all(2),
          color: Colors.amber[600],
          height: 50,
          child: Center(
            child: Text('静态路由'),
            ),
        ),

        onTap: (){
          //静态路由
          Navigator.of(context).pushNamed('/DetailView');
        },
      ),
      GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(1),
          color: Colors.amber[600],
          height: 100,
          child: Center(
            child: Text('动态路由: 1'),
          ),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return DetailView("动态路由1");
          }));
        },
      ),
      GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(1),
          color: Colors.amber[600],
          height: 100,
          child: Center(
            child: Text('动态路由: 2'),
          ),
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return DetailView("动态路由2");
          }));
        },
      ),
      GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(1),
          color: Colors.amber[600],
          height: 100,
          child: Center(
            child: Text('iOS 风格 动态路由: 1'),
          ),
        ),
        onTap: (){
          //貌似没有太大的区别
          Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> DetailView("iOS 风格 动态路由: 1")));
        },
      ),
      GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(1),
          color: Colors.amber[600],
          height: 100,
          child: Center(
            child: Text('指定系统转场动画'),
          ),
        ),
        onTap: (){
          //貌似没有太大的区别
          Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(microseconds: 5000), // 0.5 秒  这个参数貌似没有鸟用!!!!
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
              return FadeTransition(
                opacity: animation,
                child: DetailView('动画'),
              ); 
            }

          ));
        },
      ),
      GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(1),
          color: Colors.amber[600],
          height: 100,
          child: Center(
            child: Text('自定义转场动画'),
          ),
        ),
        onTap: (){
          
          Navigator.of(context).push(
            CustomPageRoute(pageBuilder: (conext){
              return DetailView('自定义转场动画');
            })
          );
        },
      ),
    ],
  );
}

class NavGuideWidget extends StatelessWidget implements WidgetProtocol {
  String title;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: navGuideListView(context),
    );
  }

  @override
  void setupParamDict(Map dict) {
      title = dict["title"];
  }
}