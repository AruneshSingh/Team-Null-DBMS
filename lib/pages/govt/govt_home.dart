import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GovtHome extends StatefulWidget {
  @override
  _GovtHomeState createState() => _GovtHomeState();
}

class _GovtHomeState extends State<GovtHome> {

  String url ='';
  Response response;
  var query7, query8, query9, query10, query11, query12;

  bool showData = false;

  Future getData() async {
    url="http://10.0.2.2:5000/query7?";
    response = await get(url);
    query7 = response.body;
    print(query7);

    url="http://10.0.2.2:5000/query8?";
    response = await get(url);
    query8 = response.body;
    print(query8);

    url="http://10.0.2.2:5000/query9?";
    response = await get(url);
    query9 = response.body;
    print(query9);

    url="http://10.0.2.2:5000/query10?";
    response = await get(url);
    query10 = response.body;
    print(query10);

    url="http://10.0.2.2:5000/query11?";
    response = await get(url);
    query11 = response.body;
    print(query11);

    url="http://10.0.2.2:5000/query12?";
    response = await get(url);
    query12 = response.body;
    print(query12);

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Government Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: showData ? Column(
          children: <Widget>[
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'What is the most common reason for challans?',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(query7),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Which road needs better surveillance?',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(query8),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'What is the best road to improve street lighting?',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(query9),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'What is the best road to improve road quality?',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(query10),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Which places are visited most frequently?',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(query11),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'How much revenue has been generated for the government?',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(query12),
            
          ],
        ) 
        : Center(child: Text('Loading')),
      ),
    );
  }
}