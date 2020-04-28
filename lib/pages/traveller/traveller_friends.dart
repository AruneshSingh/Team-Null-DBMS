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
    return Container(

      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Friends and their Location: ',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(

              itemCount: widget.friendData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(widget.friendData[index]),
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