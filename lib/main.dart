import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_word/Home/DetailView.dart';
import 'SecondViewController.dart';
import 'SecondUseButton.dart';
import 'RouteItem.dart';
import 'LayoutViewGuide.dart';
import 'MyListView.dart';
import 'LayoutViewOther.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'ListLayout_iOS.dart';
import 'UseContainer.dart';
import 'UseWidget.dart';
import 'Home/Home.dart';



void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      title: "Flutter Demo",
      theme: new ThemeData(
      ),
      home: new HomeViewWidget(),
      routes: <String, WidgetBuilder>{
        '/DetailView':(_)=> new DetailView('静态路由')
      },
    );
  }
}

class MyAppHome extends StatelessWidget {
  final items = <String>["Button 使用", "B", "C","D","E", "F", "M", "L", "N"];
  final List<RouteItem> routeFunctions = <RouteItem>[];

  @override
  Widget build(BuildContext context) {
    this.createRouteItems();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("NavTitle"),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        itemCount: routeFunctions.length,
        scrollDirection: Axis.vertical,
      
        separatorBuilder: (BuildContext context,int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: new Text('Enter --> ${this.getRouteItemNameBy(index)}'),
            onTap: (){
              this.getRouteItemBy(index).toFunction(index:index, context:context);
            },
          );
        },
      ),
    );
  }
  void onRouteUseButton({int index, BuildContext context}) {

    //Navigator.push(context, MaterialPageRoute(builder: (context) => new SecondScreen(viewTitle: this.getRouteItemNameBy(index))));
    Navigator.push(context, MaterialPageRoute(builder: (context)=> new SecondeUseButtonStateWidget(viewTitle: this.getRouteItemNameBy(index))));
  }

  void onRouteLayoutGuide ({int index, BuildContext context}) {
    
    Navigator.push(context, MaterialPageRoute(builder: (context)=> new MyLayoutGuide()));
  }

  void onRouteNetworkRequest ({int index, BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> new MyListView()));
  }

  void onRouteLayoutOther ({int index, BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> new CustomLayoutLean()));
  }

  void onRouteiOSLayout ({int index, BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> new AppleTabView()));
  }

  void onRouterUseContainerView({int index, BuildContext context}) { 
    Navigator.push(context, MaterialPageRoute(builder: (context)=>  UseContainer()));
  }

  void onRouteWidgetUse({int index, BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>  UseWidget()));
  }

  //配置路由 名称&&跳转函数
  void createRouteItems () {
    this.routeFunctions.add(RouteItem.createItem(itemName: "Button 使用", toFunction: this.onRouteUseButton));
    this.routeFunctions.add(RouteItem.createItem(itemName: "Flutter Layout Guide", toFunction: this.onRouteLayoutGuide));
    this.routeFunctions.add(RouteItem.createItem(itemName: "ListView Base NetWork", toFunction: this.onRouteNetworkRequest));
    this.routeFunctions.add(RouteItem.createItem(itemName: "Other Lean", toFunction: this.onRouteLayoutOther));
    this.routeFunctions.add(RouteItem.createItem(itemName: "iOS  style", toFunction: this.onRouteiOSLayout));
    this.routeFunctions.add(RouteItem.createItem(itemName: "Use ContainerView ", toFunction: this.onRouterUseContainerView));
    this.routeFunctions.add(RouteItem.createItem(itemName: "State or Stateless Widget Guide  ", toFunction: this.onRouteWidgetUse));
  }


  String getRouteItemNameBy(int index) {
    return this.getRouteItemBy(index).itemName;
  }
  Function getRouteItemFunBy(int index) {
    return this.getRouteItemBy(index).toFunction;
  }
  RouteItem getRouteItemBy(int index) {
    return this.routeFunctions[index];
  }
}
