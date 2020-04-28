import 'package:flutter/material.dart';

class DriverMap extends StatefulWidget {

  var mapData;
  DriverMap({this.mapData});

  @override
  _DriverMapState createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('${widget.mapData}')),
    );
  }
}