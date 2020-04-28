import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PoliceInfo extends StatefulWidget {
  @override
  _PoliceInfoState createState() => _PoliceInfoState();
}

class _PoliceInfoState extends State<PoliceInfo> {

  String url ='';
  Response response;
  var accidentData, challanData;

  bool showData = false;

  Future getData() async {
    url="http://10.0.2.2:5000/query14?";
    response = await get(url);
    accidentData = response.body;
    print(accidentData);

    url="http://10.0.2.2:5000/query16?";
    response = await get(url);
    challanData = response.body;
    print(challanData);

    setState(() => showData = true);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: showData ? Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text('Road with maximum accidents: '),
            SizedBox(height: 20),
            Text(accidentData),
            SizedBox(height: 20),
            Text('Most Challans: '),
            SizedBox(height: 20),
            Text(challanData),
            
          ],
        ) 
        : Center(child: Text('Loading')),
      ),
    );
  }
}