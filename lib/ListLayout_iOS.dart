import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppleTabView extends StatefulWidget {

  @override
  _AppleTabViewState createState() => _AppleTabViewState();
}
class _AppleTabViewState extends State<AppleTabView> {

  CupertinoPageScaffold getPageByIndex(int index) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Title'),
          backgroundColor: Colors.white,
        ),
        child: getPageBodyByIndex(index)
      );
  }

  Widget getPageBodyByIndex(int index) {
    if (index == 0) {
      return getFirstPage();
    } else if (index == 1) {
      return getSecondPage();
    } else {
      return getThreePage();
    }
  }
  Widget getFirstPage() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: Text(index.toString()),
          );
        },
    );
  }
  Widget getSecondPage() {
    return ListView(
      children: <Widget>[
        Text('A 1'),
        Text('B 1'),
        Text('C 1'),
        Text('D 1'),
      ],
    );
  }
  Widget getThreePage() {
    return ListView(
      children: <Widget>[
        Text('A 2'),
        Text('B 2'),
        Text('C 2'),
        Text('D 2'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      
      tabBar: CupertinoTabBar(

        items: [
          BottomNavigationBarItem(
            title: Text('自行车'),
            icon: Icon(Icons.directions_bike,),
          ),
          BottomNavigationBarItem(
            title: Text('轮渡'),
            icon: Icon(Icons.directions_boat),
          ),
          BottomNavigationBarItem(
            title: Text('火车'),
            icon: Icon(Icons.directions_transit,),
          ),
        ],
        // backgroundColor: Colors.blue,
      ),
      tabBuilder: (BuildContext context, int index){
        return CupertinoTabView(
            builder: (BuildContext context) {
              return getPageByIndex(index);
            },
        );
      },
    );
  }
}