import 'package:flutter/material.dart';
import 'package:store_flutter/page/cart/CartWiget.dart';
import 'package:store_flutter/page/home/HomeWiget.dart';
import 'package:store_flutter/page/my/MyWiget.dart';
import 'package:store_flutter/page/search/SearchWiget.dart';
import 'package:store_flutter/share/ShareData.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String curCity = "深圳";

  final _widgetItems = <Widget>[
    HomeWiget(),
    SearchWiget(),
    CartWiget(),
    MyWiget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShareDataInheritedWidget(curCity,
          widget: _widgetItems[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('查找')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text('购物车')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的'))
        ],
        currentIndex: _selectedIndex,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
