import 'package:flutter/material.dart';

class CartWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartWigetState();
  }
}

class CartWigetState extends State<CartWiget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('购物车 page'),
    );
  }
}
