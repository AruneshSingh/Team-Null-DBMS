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
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Road with maximum accidents: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(accidentData),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Most Challans: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(challanData.substring(1,challanData.length - 2)),
            
          ],
        ) 
        : Center(child: Text('Loading')),
      ),
    );
  }
}