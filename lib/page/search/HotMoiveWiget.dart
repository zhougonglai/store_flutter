import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_flutter/model/HotMovieData.dart';
import 'package:http/http.dart' as http;

class HotMoiveWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotMoiveState();
  }
}

class HotMoiveState extends State<HotMoiveWiget> {
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
    return hotMovies == null || hotMovies.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.count(
            primary: true,
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            addAutomaticKeepAlives: true,
            childAspectRatio: 0.5,
            crossAxisCount: 2,
            children: hotMovies.map((HotMovieData hotMoive) {
              return Card(
                semanticContainer: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.network(
                              hotMoive.images.medium,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                              child: Text(hotMoive.title,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                            ),
                          ],
                        )),
                    ButtonTheme.bar(
                      highlightColor: Colors.blueAccent,
                      padding: EdgeInsets.all(0),
                      child: ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          RaisedButton(
                            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                            child: const Text('加入购物车',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {/* ... */},
                          ),
                          FlatButton(
                            child: const Text('收藏'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList());
  }
}
