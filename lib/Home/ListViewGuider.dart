import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Base/WidgetProtocol.dart';


/* README

ListView 的使用

ListView 常见的集中初始化方法
1.直接使用ListView 初始化, 在child 中返回Widget 数组

2.使用ListView.builder 初始化ListView ,需要传入一个itemBuilder 的 block ,构建item (相当于iOS 中的Cell)

3.使用ListView.separated 构建, 需要传入  separatorBuilder  和 需要传入一个itemBuilder block 分别用于构建 分割线和Cell 

4.Cell 的点击事件需要使用手势包含Widget 就可以响应Cell 的的点击事件

5.监听ListView 的滑动事件,,, 定义个

*/


/* ========例子 1================= */
//ListView 使用 
Widget listViewDemoOne() {
  return ListView(
    padding: const EdgeInsets.all(8),
    children: <Widget>[
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(child: Text('Entry A'),),
      ),
      Container(height: 50,
        color: Colors.amber[500],
        child: const Center(child: Text('Entry B'),)
      ,),
      Container(
        height: 50,
        color: Colors.amber[100],
        child: const Center(child: Text('Entry C'),),
      )
    ],
  );
}
/* ========例子 2================= */
//使用ListViewBuilder 创建 ListView
Widget listViewDemoTwo(List<String> array){
  return ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: array.length,
    itemBuilder: (BuildContext context, int index){
      return Container(
        height: 50,
        color: Colors.amber[index * 100 + 400],
        child: Center(child:  Text('Entry ${array[index]}'),),
      );
    },
  );
}
/* ========例子 3================= */
//ListviewBuider 不同style 的 Cell
Widget listViewCellStyleOne(String title) {
  return Container(
    margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
    height: 100,
    child: Center(child: Text('This is Style One $title'),),
    color: Colors.amber[400],
  );
}

Widget listViewCellStyleTwo(String title) {
  return Container(
    margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
    height: 150,
    child: Center(child: Text('Style Two $title'),),
    color: Colors.amber[700],
  );
}

Widget listViewDemoThree (List<Map<String, String>> array) {
  return ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: array.length,
    
    itemBuilder: (BuildContext context, int index){

      var map = array[index];
      var style = map["style"];
      var title = map["title"];
      if (style == "1"){
        return listViewCellStyleOne(title);
      } else if (style == '2') {
        return listViewCellStyleTwo(title);
      }
      return Container();
    }
  );
}
/* ========例子 4================= */
//ListView 分割线
Widget listViewDemoFour(List<Map<String, String>> array) {
  return ListView.separated(
    itemCount: array.length,
    separatorBuilder: (BuildContext context , int index){
      return Container(
        child: Center(child: Text('separated line'),),
      );
    },
    itemBuilder: (BuildContext context, int index) {
      var map = array[index];
      var style = map["style"];
      var title = map["title"];
      if (style == "1"){
        return listViewCellStyleOne(title);
      } else if (style == '2') {
        return listViewCellStyleTwo(title);
      }
      return Container();
    },
  );
}
/* ========例子 5================= */
//ListView 点击事件,, 在 item 中使用GestureDetector 包含这个item 就可以响应点击事件
Widget listViewDemoFive(ScrollController ctrl) {
  return ListView(
    controller: ctrl,
    padding: const EdgeInsets.all(8),
    physics: AlwaysScrollableScrollPhysics(),
    children: <Widget>[
      Container(
        height: 100,
        color: Colors.amber[600],
        child: const Center(child: Text('Entry AAAA'),),
      ),
      Container(height: 100,
        color: Colors.amber[500],
        child: const Center(child: Text('Entry BBBBB'),)
      ,),
      GestureDetector(child: Container(
        height: 100,
        color: Colors.amber[100],
        child: const Center(child: Text('Entry CCCCCC'),),
      ),onTap: (){
        print('on Tap');
      },)
    ],
  );
}
class ListViewGuider extends StatelessWidget implements WidgetProtocol{

  String title;
  ScrollController _controller;

  void _scrollListener() {
    String message = '';
    if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
      message = "reach the bottom";
      print(message);
    }
    if (_controller.offset <= _controller.position.minScrollExtent && !_controller.position.outOfRange) {
      message = "reach the top";
      print(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
        actions: <Widget>[
          FlatButton(
            child: Text('Action'), 
            highlightColor: Colors.transparent,
            splashColor:Colors.transparent,
            onPressed: (){
              
            },
          )
        ],
      ),
      body: Container(
        // child: listViewDemoOne()
        // child: listViewDemoTwo(['AA', 'BB', 'CC']),
        // child: listViewDemoThree(array),
        // child: listViewDemoFour(array),
        child: listViewDemoFive(_controller),
      
      ),
    );
  }

  @override
  void setupParamDict(Map dict) {
    title = dict["title"];
  }
}