import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_flutter/model/HotMovieData.dart';
import 'package:store_flutter/page/search/ComingMoiveWiget.dart';
import 'package:store_flutter/page/search/HotMoiveWiget.dart';
import 'package:http/http.dart' as http;

class SearchWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchWidgetState();
  }
}

class SearchWidgetState extends State<SearchWiget> {
  final List<Tab> _tablViews = <Tab>[
    Tab(
      text: '正在热映',
    ),
    Tab(
      text: '即将上映',
    ),
  ];

  List<HotMovieData> hotMovies = new List();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    List<HotMovieData> serverDataList = new List();
    var response = await http.get(
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=10');
    if (response.statusCode == 200) {
      Map responseJson = json.decode(response.body);
      for (dynamic data in responseJson['subjects']) {
        HotMovieData hotMovieData = HotMovieData.fromJson(data);
        serverDataList.add(hotMovieData);
      }
      setState(() {
        hotMovies = serverDataList;
      });
    } else {
      print('error');
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 80),
              alignment: Alignment.bottomCenter,
              color: Colors.blue,
              child: TabBar(
                tabs: _tablViews,
                indicatorColor: Colors.pink,
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                  children: [HotMoiveWiget(hotMovies), ComingMoiveWiget()]),
            )
          ],
        ));
  }
}
