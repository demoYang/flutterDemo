import 'package:flutter/material.dart';


class DetailView extends StatelessWidget {

  final String paramOne;
  DetailView(this.paramOne);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(paramOne),

      ),
      body: Center(
        child: Text('DetailView'),
      ),
    );
  }
}