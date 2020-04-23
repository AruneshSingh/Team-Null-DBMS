import 'package:flutter/material.dart';

class TravellerPlaceDetails extends StatefulWidget {
  @override
  _TravellerPlaceDetailsState createState() => _TravellerPlaceDetailsState();
}

class _TravellerPlaceDetailsState extends State<TravellerPlaceDetails> {

  final placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Place: '),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: placeController,
                      decoration: InputDecoration(
                        hintText: 'Enter place'
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  print(placeController.text);
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                  ),
                elevation: 0,
                color: Colors.black,
              ),
          ],
        ),
      ),
    );
  }
}