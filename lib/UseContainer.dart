import 'package:flutter/material.dart';




class UseContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("UseContainer")
      ),
      body:  Column(
        children: <Widget>[
          CustomButton(),
          getPadding(context),
          getAligin(),
        ],
      ),
      backgroundColor: Colors.orange,
    );
  }

  Align getAligin() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text("Word"),
      widthFactor: 2.0,
      heightFactor: 2.0,
    );
  }

  Padding getPadding(BuildContext context) {
    return Padding(
      child: Text("Padding"),
      padding: EdgeInsets.all(10),
    );
  }

  Container getCustomContainer (BuildContext context) {

    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0
      ),
      decoration: BoxDecoration(
        border: new Border.all(width: 2.0, color: Colors.red),
        color: Colors.grey,
        borderRadius: BorderRadius.all(new Radius.circular(20.0)),
        image: DecorationImage(
          image: NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
          centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text('HelloWord', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black),),
      transform: Matrix4.rotationZ(0.3),
    );
  }
}

/*
Container 属性解析 

key：Container唯一标识符，用于查找更新。

alignment：控制child的对齐方式，如果container或者container父节点尺寸大于child的尺寸，这个属性设置会起作用，有很多种对齐方式。

padding：decoration内部的空白区域，如果有child的话，child位于padding内部。padding与margin的不同之处在于，padding是包含在content内，而margin则是外部边界，设置点击事件的话，padding区域会响应，而margin区域不会响应。

color：用来设置container背景色，如果foregroundDecoration设置的话，可能会遮盖color效果。

decoration：绘制在child后面的装饰，设置了decoration的话，就不能设置color属性，否则会报错，此时应该在decoration中进行颜色的设置。 !!!!!!

foregroundDecoration：绘制在child前面的装饰。

width：container的宽度，设置为double.infinity可以强制在宽度上撑满，不设置，则根据child和父节点两者一起布局。

height：container的高度，设置为double.infinity可以强制在高度上撑满。

constraints：添加到child上额外的约束条件。

margin：围绕在decoration和child之外的空白区域，不属于内容区域。

transform：设置container的变换矩阵，类型为Matrix4。

child：container中的内容widget。

 */


class CustomButton extends StatefulWidget {
  @override
  _CustomButtonElement createState() => _CustomButtonElement();
}
class _CustomButtonElement extends State<CustomButton> {

  int customStaute = 1;

  void updateState () {

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (){
        
        print("on button actions");
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("Sending Message"),
        ));

      },
      onTapDown: (TapDownDetails details) {
        customStaute = 2;
        updateState();
      },
      onTapUp: (TapUpDetails details) {
        customStaute = 1;
        updateState();
      },
      child: Container(
        child: Text("Title"),
        decoration: BoxDecoration(
          color: customStaute == 2 ? Colors.lightGreen : Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        width: 120,
        height: 40,
        alignment: Alignment.center,
      ),
    );
  }
}


/**
 * 
 * Padding 
 * 
 * 属性 
 * @required padding
 * Widget child
 *  
 */
/**
 * 继承关系 : Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > Align
 * Align
 * 
 * 属性:
 * aligment
 * WidthFactor
 * heightFactor
 * child
 */

/**
 * Center 
 * 
 * 继承与Align
 * 
 * 
 */