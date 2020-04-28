import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:team_null_dbms/pages/police/police_challan.dart';
import 'package:team_null_dbms/pages/police/police_friends.dart';
import 'package:team_null_dbms/pages/police/police_info.dart';
import 'package:team_null_dbms/pages/police/police_timeInfo.dart';


class PoliceHome extends StatefulWidget {
  @override
  _PoliceHomeState createState() => _PoliceHomeState();
}

class _PoliceHomeState extends State<PoliceHome> {

  int _currentTab = 0;
  PageController _pageController;

  final _formKey = GlobalKey<FormState>();
  String officer = '';

  String url='';
  var otherPoliceData;

  bool gotData = false;

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
        title: Text('Police Home'),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          PoliceInfo(),
          PoliceTimeInfo(),
          PoliceFriends(friendData: otherPoliceData),
          PoliceChallan(),
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
            curve: Curves.easeIn
          );
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              size: 32,
            ),
            title: Text('Info'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time,
              size: 32,
            ),
            title: Text('Time Info'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin_circle,
              size: 32,
            ),
            title: Text('Friends'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note,
              size: 32,
            ),
            title: Text('Challan'),
          ),
        ],
      ),
    )

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
                  hintText: 'Police ID',
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
                  setState(() => officer = val);
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
                  url="http://10.0.2.2:5000/query5?"+'num1=$officer';
                  otherPoliceData = await getData(url);
                  int x = otherPoliceData.length;
                  otherPoliceData = otherPoliceData.substring(1,x-2);
                  otherPoliceData = otherPoliceData.split("\",");
                  for (var i = 0; i < otherPoliceData.length; i++) {
                    otherPoliceData[i] = otherPoliceData[i].substring(1);
                  }
                  otherPoliceData[otherPoliceData.length - 1] = otherPoliceData[otherPoliceData.length - 1].substring(0,otherPoliceData[otherPoliceData.length - 1].length - 2);
                  print(otherPoliceData);

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