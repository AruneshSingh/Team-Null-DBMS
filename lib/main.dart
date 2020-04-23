import 'package:flutter/material.dart';
import 'package:team_null_dbms/pages/mainHome.dart';
import 'package:team_null_dbms/pages/loading.dart';
import 'package:team_null_dbms/pages/traveller/traveller_homeScreen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => MainHome(),
    '/traveller_home' : (context) => TravellerHomeScreen(),
  },
));
