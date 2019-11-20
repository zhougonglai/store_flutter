import 'package:flutter/material.dart';

class ShareDataInheritedWidget extends InheritedWidget {
  final String curCity;

  ShareDataInheritedWidget(this.curCity, {Widget widget})
      : super(child: widget);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return (oldWidget as ShareDataInheritedWidget).curCity != curCity;
  }
}
