import 'dart:async';
import 'package:flutter/cupertino.dart';

class retroDesign extends StatefulWidget {
  retroDesign({Key key}) : super(key: key);

  @override
  _retroDesignState createState() => _retroDesignState();
}

class _retroDesignState extends State<retroDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("hoi"),
      color: CupertinoColors.systemIndigo,
    );
  }
}
