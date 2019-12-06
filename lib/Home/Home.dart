import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_word/Home/WidgetStateGuide.dart';

//route item
import 'CustomRouteItem.dart';
//guide 
import 'ListViewGuider.dart';
import 'NavGuideWidget.dart';


class HomeViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return HomeViewWidgetState();
  }
}
Widget listViewDemo(List<CustomRouteItem> list, BuildContext navContext){
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index){
      CustomRouteItem item = list[index];
      return GestureDetector(
        child: Container(
            height: 88,
            color: Colors.amber[600],
            margin: const EdgeInsets.all(2),
            child: Center(child: Text('${item.name}')),
        ),
        onTap: (){
          item.routeToWidget(navContext);
        },
      );
    },
  );
}

class HomeViewWidgetState extends State<HomeViewWidget> {

  ScrollController _controller;
  final List<CustomRouteItem> routeList = <CustomRouteItem>[];

  @override
  void initState() {
  
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void genDataSource() {
    routeList.clear();
    routeList.add(CustomRouteItem(name: 'Flutter 路由使用', toWidget: NavGuideWidget(), paramDict: {"title":"This Title "}));
    routeList.add(CustomRouteItem(name: 'Flutter ListView使用', toWidget: ListViewGuider(), paramDict: {"title":"This Title "}));
    routeList.add(CustomRouteItem(name: 'Widget State 使用', toWidget: WidgetStateGuide(), paramDict: {"title":"This Title "}));
  }

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
    genDataSource();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 使用'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: listViewDemo(routeList, context),
      ),
    );
  }
}


