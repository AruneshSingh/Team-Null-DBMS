import 'package:flutter/material.dart';
import 'package:team_null_dbms/pages/driver/driver_map.dart';
import 'package:team_null_dbms/pages/driver/driver_nearby.dart';
import 'package:http/http.dart';


class DriverHomeScreen extends StatefulWidget {
  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {

  final _formKey = GlobalKey<FormState>();
  String placeA = '';
  String placeB = '';

  String url='';
  var mapData, gasStationData, parkingData,ambienceData;

  bool gotData = false;

  int _currentTab = 0;
  PageController _pageController;

  Future getData(url) async {
    Response response = await get(url);
    return response.body;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return gotData ?

    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Driver Home'),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          DriverMap(mapData: mapData,ambienceData:ambienceData),
          DriverNearby(gasStationData: gasStationData, parkingData: parkingData),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 32,
            ),
            title: Text('Map'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              size: 32,
            ),
            title: Text('Nearby'),
          ),
        ],
      ),
    )
    
    //if not got data then get data with this screen
    : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Enter Details'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal:50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Place A ID',
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
                  setState(() => placeA = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Place B ID',
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
                  setState(() => placeB = val);
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
                  url="http://10.0.2.2:5000/query1?"+'num1=$placeA'+'&num2=$placeB';
                  print(url);
                  mapData = await getData(url);
                  int x = mapData.length;
                  mapData = mapData.substring(1,x-2);
                  mapData = mapData.split(",");
                  print(mapData);

                  url="http://10.0.2.2:5000/query3?"+'num1=$placeA';
                  print(url);
                  gasStationData = await getData(url);
                  x = gasStationData.length;
                  gasStationData = gasStationData.substring(1,x-2);
                  gasStationData = gasStationData.split(",");
                  print(gasStationData);

                  url="http://10.0.2.2:5000/query4?"+'num1=$placeA';
                  print(url);
                  parkingData = await getData(url);
                  x = parkingData.length;
                  parkingData = parkingData.substring(1,x-2);
                  parkingData = parkingData.split(",");
                  print(parkingData[0]);
                  print(parkingData);


                  url="http://10.0.2.2:5000/query20?"+'num1=$placeA'+'&num2=$placeB';
                  print(url);
                  ambienceData = await getData(url);
                  print(ambienceData);


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