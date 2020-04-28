import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PoliceTimeInfo extends StatefulWidget {
  @override
  _PoliceTimeInfoState createState() => _PoliceTimeInfoState();
}

class _PoliceTimeInfoState extends State<PoliceTimeInfo> {
  final _formKey = GlobalKey<FormState>();
  String time = '';

  String url = '';

  var leastCongestedData, mostCongestedData;

  bool gotData = false;

  Future getData(url) async {
    Response response = await get(url);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return gotData ?
    
    Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Most Congested: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(mostCongestedData.substring(1,mostCongestedData.length-2)),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Least Congested: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(leastCongestedData.substring(1,leastCongestedData.length-2))
          ],
        ),
      ),
    )

    : Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal:50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Time',
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
                  setState(() => time = val);
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
                  url="http://10.0.2.2:5000/query15?"+'num1=$time';
                  print(url);
                  mostCongestedData = await getData(url);
                  print(mostCongestedData);

                  url="http://10.0.2.2:5000/query17?"+'num1=$time';
                  print(url);
                  leastCongestedData = await getData(url);
                  print(leastCongestedData);

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