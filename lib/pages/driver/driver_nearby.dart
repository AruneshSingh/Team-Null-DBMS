import 'package:flutter/material.dart';

class DriverNearby extends StatefulWidget {

  var gasStationData, parkingData;
  DriverNearby({this.gasStationData , this.parkingData});

  @override
  _DriverNearbyState createState() => _DriverNearbyState();
}

class _DriverNearbyState extends State<DriverNearby> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text("Nearby Gas Stations: "),
          SizedBox(height: 10),
          Text('${widget.gasStationData}'),
          SizedBox(height: 10),
          Text("Nearby Parking Places: "),
          SizedBox(height: 10),
          Text('${widget.parkingData}'),
        ],
      )
    );
  }
}