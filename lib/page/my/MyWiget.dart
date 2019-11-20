import 'package:flutter/material.dart';

class MyWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<MyWiget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的 page'),
    );
  }
}
