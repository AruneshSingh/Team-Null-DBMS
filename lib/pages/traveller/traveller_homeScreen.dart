import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'traveller_planTravel.dart';
import 'traveller_placeDetails.dart';
import 'traveller_friends.dart';


class TravellerHomeScreen extends StatefulWidget {
  @override
  _TravellerHomeScreenState createState() => _TravellerHomeScreenState();
}

class _TravellerHomeScreenState extends State<TravellerHomeScreen> {

  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Traveller Home'),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          TravellerPlanTravel(),
          TravellerPlaceDetails(),
          TravellerFriends(),
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
            title: Text('Search'),
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
    );
  }
}