
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => new _MyListViewState();
}
class _MyListViewState extends State<MyListView> {

  var listData = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData () async {
    //var url = 'https://jsonplaceholder.typicode.com/posts';
    var httpClient = new HttpClient();
    var uri = new Uri.https('jsonplaceholder.typicode.com', 'posts');
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    
    var responseBody = await response.transform(utf8.decoder).join();

    var data = jsonDecode(responseBody);
    setState(() {
      listData = data;
      print(listData.length);
    });
  }

  @override
  Widget build(BuildContext context) {

    showLoadingWidget() {
      return listData.length == 0;
    }

    getLoadingWidget() {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    getBody() {
      if (showLoadingWidget()) {
        return getLoadingWidget();
      } else {
        return ListView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context , int index){
            return ListTile(
              title: new Text(listData[index]["title"]), 
            );
          },
        );
      }
    }
    
    return Scaffold(
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        child: Text('Back'),
        onPressed: () => Navigator.pop(context),
      ),
    );

  }
}