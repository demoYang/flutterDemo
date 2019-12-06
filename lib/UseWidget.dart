import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';

class UseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Guide'),
      ),
      body: PageListView(),
      // backgroundColor: Colors.red,
    );
  }
}

class PageListView extends StatefulWidget {
  @override
  _PageListViewState createState() => _PageListViewState();
}
class _PageListViewState extends State <PageListView> {

  int itemCount = 2;

  bool listExpand = false;

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(

      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return ListCardCell();
        } else if (index == 1) {
          return Container(
            child: ListTextCell(),
          );
        }
      },
    );
  }
}
class ListCardCell extends StatelessWidget {

  final List items = [1,2,3,4,5,6];

  int selectedIndex = 0;

  double getSize(BuildContext context) {
    return (MediaQuery.of(context).size.width - 48) / 3;
  }

  Container getBanner() {
    return Container(
      height: 18,
      width: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFFFAE31),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0), bottomRight: Radius.circular(4.0))
      ),
      child: Text(
        "充值",
        style: TextStyle(
          color: Color(0xFFE25B21),
          fontSize: 10
        ),
        ),
    );
  }

  Container getBCoinCount(String count) {
      return Container(
        height: 28,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: "$count",
            style: TextStyle(
              color: Color(0xFFFF8A2C),
              fontSize: 20,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "漫币",
                style: TextStyle(
                  color: Color(0xFFFF8A2C),
                  fontSize: 14
                )
              )
            ]
          ),
        ),
      );
  }

  Container getMoney(String money, double size) {
    return Container(
      height: 20,
      width: size,
      alignment: Alignment.center,
      child: Text(
        "￥$money",
        style: TextStyle(
          color: Color(0xFF999999),
          fontSize: 14.0
        ),
      ),
    );
  }

  Container getReward(String reward, double size) {
    return Container(
      height: 16,
      width: size,
      alignment: Alignment.center,
      child: Text(
        "$reward",
        style: TextStyle(
          color: Color(0xFFFF8A2C),
          fontSize: 11
        ),
        ),
    );
  }

  Container getItemContainer(int index, double size) {
    
    Color borderColor = index == selectedIndex ? Color(0xFFFF8A2C) : Colors.transparent;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.5
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, 2)
            )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getBanner(),
          SizedBox(height: 6, width: size,),
          getBCoinCount("600"),
          SizedBox(height: 6, width: size,),
          getMoney("188.00", size),
          SizedBox(height: 6, width: size,),
          getReward("送9900漫读券", size),
          SizedBox(height: 10, width: size,),
        ],
      ),
    );
  }

  Container getRowContainerItems(BuildContext context, int rowIndex) {
    double size = getSize(context);
    return Container(
      height: size + 12,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          getItemContainer(rowIndex + 0, size),
          getItemContainer(rowIndex + 1, size),
          getItemContainer(rowIndex + 2, size),
        ],
      ),
    );
  }

  Container getContainerWidget (BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      color: Color(0xFFF5F7F8),
      child: Column(
        children: <Widget>[
          getRowContainerItems(context, 0),
          getRowContainerItems(context, 1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getContainerWidget(context);
  }
}



class ListTextCell extends StatelessWidget{

  final TextStyle normalStyle = TextStyle(
    color: Color(0xFF90959B),
    fontSize: 12
  );

  final TextStyle linkStyle = TextStyle(
    color: Color(0xFF1C1D1F),
    fontSize: 12,
    decoration: TextDecoration.underline,    
  );

  final TapGestureRecognizer recognizer = new TapGestureRecognizer();
  
  @override
  Widget build(BuildContext context) {

    recognizer.onTap = () {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('协议被点击!'),
      ));
    };
    
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          firstText(),
          secondRichText(),
          threeText(),
          fourText()
        ],
      ),
    );
  }
  Text firstText() {
      return Text(
        "首充奖励仅对第一笔充值有效，与充值档位无关",
        style: normalStyle,
        );
    }
    RichText secondRichText() {
      return RichText(
          text: TextSpan(
            text: "安卓和IOS漫币不通用，详情查看",
            style: normalStyle,
            children:<TextSpan> [
              TextSpan(
                text: "充值说明",
                style: linkStyle,
                recognizer: recognizer
              ),
            ]
          ),
      );
    }
    Text threeText() {
      return Text(
        "漫币用于购买付费章节",
        style: normalStyle,
        );
    }
    RichText fourText () {
      return  RichText(
            text: TextSpan(
              text: "若支付成功，但漫币未到账，点击",
              style: normalStyle,
              children:<TextSpan> [
                TextSpan(
                  text: "查看帮助",
                  style: linkStyle,
                  recognizer: recognizer
                ),
              ]
            ),
          );
    }
}
