import 'package:flutter/material.dart';

class TravellerPlanTravel extends StatefulWidget {
  @override
  _TravellerPlanTravelState createState() => _TravellerPlanTravelState();
}

class _TravellerPlanTravelState extends State<TravellerPlanTravel> {

  final timeController = TextEditingController();
  final moneyController = TextEditingController();
  final interestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Time (in Hrs): '),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                      hintText: 'Enter time you have'
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Money (in Rs): '),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: moneyController,
                    decoration: InputDecoration(
                      hintText: 'Enter money you have'
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Interest: '),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: interestController,
                    decoration: InputDecoration(
                      hintText: 'Enter your interest'
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: () {
                print(timeController.text);
                print(moneyController.text);
                print(interestController.text);
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
                ),
              elevation: 0,
              color: Colors.black,
              
            ),
          ]
        ),
      )
    );
  }
}