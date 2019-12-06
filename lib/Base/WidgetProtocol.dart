
import 'package:flutter/material.dart';

abstract class WidgetProtocol extends Widget {
  @required void setupParamDict(Map dict);
}