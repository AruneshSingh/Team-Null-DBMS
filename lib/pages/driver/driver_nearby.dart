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
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Nearby Gas Stations: ',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(

              itemCount: widget.gasStationData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(widget.gasStationData[index].substring(1,widget.gasStationData[index].length - 1)),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[500]),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  color: Colors.grey[200],
                  elevation: 0,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Nearby Parking Places: ',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(

              itemCount: widget.parkingData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(widget.parkingData[index].substring(1,widget.parkingData[index].length - 1)),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[500]),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  color: Colors.grey[200],
                  elevation: 0,
                );
              },
            ),
          ),
          // SizedBox(height: 10),
          // Text('${widget.parkingData}'),
        ],
      )
    );
  }
}