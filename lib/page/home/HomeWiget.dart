import 'package:flutter/material.dart';
import 'package:store_flutter/page/home/MoviesListWidget.dart';

class HomeWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWiget> {
  String city = '定位';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(
                  city,
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              Icon(Icons.arrow_drop_down),
              Expanded(
                  flex: 1,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        hintText: '\uE8b6 电影 / 电视剧 / 影人',
                        hintStyle: TextStyle(
                            fontFamily: 'MaterialIcons', fontSize: 16),
                        contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        filled: true,
                        fillColor: Colors.black12),
                  ))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: HotMoviesListWidget(city),
        )
      ],
    );
  }
}
