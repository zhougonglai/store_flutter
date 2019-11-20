import 'package:flutter/material.dart';

class LoginWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginWigetState();
  }
}

class LoginWigetState extends State<LoginWiget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('sfaf'),
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
