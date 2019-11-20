import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_flutter/model/HotMovieData.dart';
import 'package:store_flutter/page/home/MovieItemWidget.dart';

class HotMoviesListWidget extends StatefulWidget {
  static String cuCity;

  HotMoviesListWidget(String city) {
    cuCity = city;
  }

  @override
  State<StatefulWidget> createState() {
    return HotMoviesListWidgetState();
  }
}

class HotMoviesListWidgetState extends State<HotMoviesListWidget>
    with AutomaticKeepAliveClientMixin {
  List<HotMovieData> hotMovies = new List();
  int count = 0;
  int start;
  int total;

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
      setState(() {
        count = count + responseJson['count'];
        start = start;
        total = total;
      });
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
    super.build(context);
    if (hotMovies == null || hotMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.separated(
        padding: EdgeInsets.only(top: 0),
        itemCount: hotMovies.length,
        itemBuilder: (context, index) {
          return HotMovieItemWidget(hotMovies[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black26,
          );
        },
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
