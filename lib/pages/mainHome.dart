import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team NULL'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Column(
                children: <Widget>[
                  
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400] ,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),

                    height: 120,
                    width: 120,

                    child: IconButton(
                      icon: Icon( 
                        Icons.directions_car,
                        size: 60.0,
                        color: Colors.grey[400],
                      ),

                      onPressed: () {
                        Navigator.pushNamed(context, '/driver_home');
                      },
                    ),
                  ),

                  SizedBox(height: 10.0),

                  Text(
                    "DRIVER",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(width: 30.0),

              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400] ,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      
                    ),
                    height: 120,
                    width: 120,
                    child: IconButton(
                      icon: Icon( 
                        FontAwesomeIcons.suitcaseRolling,
                        size: 60.0,
                        color: Colors.grey[400],
                      ), 
                      onPressed: () {
                        Navigator.pushNamed(context, '/traveller_home');
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "TRAVELLER",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

            ],
          ),

          SizedBox(height: 30.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400] ,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      
                    ),
                    height: 120,
                    width: 120,
                    child: IconButton(
                      icon: Icon( 
                        FontAwesomeIcons.trafficLight,
                        size: 60.0,
                        color: Colors.grey[400],
                      ), 
                      onPressed: () {
                        Navigator.pushNamed(context, '/police_home');
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "POLICE",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(width: 30.0),

              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400] ,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      
                    ),
                    height: 120,
                    width: 120,
                    child: IconButton(
                      icon: Icon( 
                        FontAwesomeIcons.briefcase,
                        size: 60.0,
                        color: Colors.grey[400],
                      ), 
                      onPressed: () {
                        Navigator.pushNamed(context, '/govt_home');
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "GOVERNMENT",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

            ],
          )
        ],
      ),

      backgroundColor: Colors.grey[900],

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Text("click"),
      //   backgroundColor: Colors.red,
      // ),

    );
  }
}