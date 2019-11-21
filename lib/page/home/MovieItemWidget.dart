import 'package:flutter/material.dart';
import 'package:store_flutter/model/HotMovieData.dart';

class HotMovieItemWidget extends StatefulWidget {
  final HotMovieData hotmoviedata;

  HotMovieItemWidget(this.hotmoviedata);

  @override
  State<StatefulWidget> createState() {
    return HotMovieItemWidgetState();
  }
}

class HotMovieItemWidgetState extends State<HotMovieItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            widget.hotmoviedata.images.medium,
            width: 80,
            height: 120,
            fit: BoxFit.cover,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.hotmoviedata.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.hotmoviedata.rating.average.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text(
                      '导演: ' +
                          widget.hotmoviedata.directors
                              .map((Cast cast) => cast.name)
                              .join(" "),
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  Text(
                      '主演: ' +
                          widget.hotmoviedata.casts
                              .map((Cast cast) => cast.name)
                              .join(" "),
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.hotmoviedata.collectCount.toString() + '人看过',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                OutlineButton(
                  child: Text(
                    '购票',
                    style: TextStyle(fontSize: 16),
                  ),
                  color: Colors.red,
                  textColor: Colors.red,
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(color: Colors.red),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
