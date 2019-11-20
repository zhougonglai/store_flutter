import 'package:flutter/material.dart';
import 'package:store_flutter/page/login/login.dart';
import 'package:store_flutter/page/root.dart';

class Router {
  static final routes = {
    "/": (BuildContext context, {Object args}) => MyHomePage(),
    "/login": (BuildContext context, {Object args}) => LoginWiget(),
  };
}
