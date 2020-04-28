import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TravellerFriends extends StatefulWidget {

  var friendData;
  TravellerFriends({this.friendData});

  @override
  _TravellerFriendsState createState() => _TravellerFriendsState();
}

class _TravellerFriendsState extends State<TravellerFriends> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.friendData)),
    );
  }
}