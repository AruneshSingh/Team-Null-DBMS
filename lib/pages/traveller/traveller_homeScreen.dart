import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'traveller_planTravel.dart';
import 'traveller_placeDetails.dart';
import 'traveller_friends.dart';
import 'package:http/http.dart';


class TravellerHomeScreen extends StatefulWidget {
  @override
  _TravellerHomeScreenState createState() => _TravellerHomeScreenState();
}

class _TravellerHomeScreenState extends State<TravellerHomeScreen> {

  int _currentTab = 0;
  PageController _pageController;

  final _formKey = GlobalKey<FormState>();
  String traveller = '';

  String url='';
  var friendData;

  bool gotData = false;

  Future getData(url) async {
    Response response = await get(url);
    friendData = response.body;
    int x = friendData.length;
    friendData = friendData.substring(1,x-2);
    friendData = friendData.split("\",");
    for (var i = 0; i < friendData.length; i++) {
      friendData[i] = friendData[i].substring(1);
    }
    friendData[friendData.length - 1] = friendData[friendData.length - 1].substring(0,friendData[friendData.length - 1].length - 2);
    print(friendData[0]);
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
        title: Text('Traveller Home'),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          TravellerPlanTravel(),
          TravellerPlaceDetails(),
          TravellerFriends(friendData: friendData),
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
              Icons.event_note,
              size: 32,
            ),
            title: Text('Plan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 32,
            ),
            title: Text('Place Detail'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin_circle,
              size: 32,
            ),
            title: Text('Friends'),
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
                  hintText: 'Person ID',
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
                  setState(() => traveller = val);
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
                  url="http://10.0.2.2:5000/query2?"+'num1=$traveller';
                  await getData(url);
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