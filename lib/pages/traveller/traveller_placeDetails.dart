import 'package:flutter/material.dart';

class TravellerPlaceDetails extends StatefulWidget {
  @override
  _TravellerPlaceDetailsState createState() => _TravellerPlaceDetailsState();
}

class _TravellerPlaceDetailsState extends State<TravellerPlaceDetails> {

  final _formKey = GlobalKey<FormState>();
  String place = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {},
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}