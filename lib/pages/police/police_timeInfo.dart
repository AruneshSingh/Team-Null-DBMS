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
            Text('Most Congested: '),
            SizedBox(height: 20),
            Text(mostCongestedData),
            SizedBox(height: 40),
            Text('Least Congested: '),
            SizedBox(height: 20),
            Text(leastCongestedData)
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