import 'package:flutter/material.dart';

class DriverMap extends StatefulWidget {

  var mapData,ambienceData;
  DriverMap({this.mapData,this.ambienceData});

  @override
  _DriverMapState createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Average Ambience Level: ',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.ambienceData.substring(1,widget.ambienceData.length - 2),
              style: TextStyle(
                
              ),
            ),
          ),
          SizedBox(height: 40),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Directions: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(

              itemCount: widget.mapData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(widget.mapData[index].substring(1,widget.mapData[index].length - 1)),
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
        ],
      ),
    );
  }
}