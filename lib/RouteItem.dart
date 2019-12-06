
import 'package:flutter/material.dart';

typedef RouteFunction = void Function({int index, BuildContext context});

class RouteItem {
  String itemName;
  RouteFunction toFunction;

  RouteItem({String itemName, RouteFunction toFunction}) {
    this.itemName = itemName;
    this.toFunction = toFunction;
  }
  static RouteItem createItem({String itemName, RouteFunction toFunction}) {
      return new RouteItem(itemName: itemName , toFunction: toFunction);
  }
}