
import 'package:flutter/material.dart';
import '../Base/WidgetProtocol.dart';

class CustomRouteItem {

  String name;
  WidgetProtocol toWidget;
  Map paramDict;

  CustomRouteItem({
    @required this.name,
    @required this.toWidget,
    this.paramDict
  });

  void routeToWidget(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      toWidget.setupParamDict(this.paramDict);
      return toWidget;
    }));
  }
}