import 'package:flutter/material.dart';

class PoliceFriends extends StatefulWidget {

  var friendData;
  PoliceFriends({this.friendData});

  @override
  _PoliceFriendsState createState() => _PoliceFriendsState();
}

class _PoliceFriendsState extends State<PoliceFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.friendData)),
    );
  }
}