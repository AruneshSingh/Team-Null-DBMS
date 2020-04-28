import 'package:flutter/material.dart';
import 'package:http/http.dart';


class TravellerPlaceDetails extends StatefulWidget {
  @override
  _TravellerPlaceDetailsState createState() => _TravellerPlaceDetailsState();
}

class _TravellerPlaceDetailsState extends State<TravellerPlaceDetails> {

  final _formKey = GlobalKey<FormState>();
  String place = '';

  String url = '';

  var placeData, driverData;

  bool gotData = false;

  Future getData(url) async {
    Response response = await get(url);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return gotData ?
    
    Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Reviews:',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(placeData),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Drivers that can pick you up:',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(driverData.substring(1,driverData.length-2)),
          ],
        ),
      ),
    )

    : Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal:50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Place',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400], width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                onChanged: (val) {
                  setState(() => place = val);
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.black,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  url="http://10.0.2.2:5000/query13?"+'num1=$place';
                  print(url);
                  placeData = await getData(url);
                  print(placeData);

                  url="http://10.0.2.2:5000/query18?"+'num1=$place';
                  print(url);
                  driverData = await getData(url);
                  print(driverData);

                  setState(() => gotData = true);
                },
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}