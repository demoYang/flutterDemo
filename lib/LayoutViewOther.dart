
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabBarModel {
  IconData iconData;
  String title;

  TabBarModel(this.iconData, this.title);
}

class CustomLayoutLean extends StatefulWidget {

  final List<TabBarModel> models = [TabBarModel(Icons.train, "动态"), TabBarModel(Icons.directions_bike, "趋势"), TabBarModel(Icons.directions_car, "我的")];

  final String title = "AppBar Test";

  @override
  _CustomLayoutLeanState createState() => new _CustomLayoutLeanState();
}

class _CustomLayoutLeanState extends State<CustomLayoutLean> with SingleTickerProviderStateMixin {

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.models.length);
    
  }
  
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      //body: new Container(child: Text('TabBarView'), alignment: Alignment.center,color: Colors.white,),
      body: getTabBarView(),
      bottomNavigationBar: bottomNavigationBar(),
      backgroundColor: Colors.blue,
    );
  }

  Widget getTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: getTabBarBodyView()
    );
  }

  List<Widget> getTabBarBodyView() {

    List<Widget> restList = <Widget>[];
    for (int i = 0 ; i < widget.models.length; i ++) {
      TabBarModel iterModel = widget.models[i];
      restList.add(
        Container(
          color: Colors.white,
          child: Icon(iterModel.iconData),
        )
      );
    }
    return restList;
  } 

  Widget bottomNavigationBar () {
    return SafeArea(
        child: TabBar(
          controller: _tabController,
          tabs: tabBarWidgets(),
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
  
      ),
    );
  }
  List<Widget> tabBarWidgets(){
    List<Widget> restList = <Widget>[];
    for (int i = 0 ; i < widget.models.length; i ++) {
      TabBarModel iterModel = widget.models[i];
      restList.add(
        Tab(
          text: iterModel.title,
          icon: Icon(iterModel.iconData),
        )
        // Container(
        //   padding: const EdgeInsets.only(top:10.0),
        //   height: 60,
        //   child: Column(
        //     children: <Widget>[
        //       Icon(iterModel.iconData),
        //       Text(iterModel.title) ,
        //     ],
        //   ),
        // )
      );
    }
    return restList;
  }
}




