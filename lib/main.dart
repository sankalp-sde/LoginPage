import 'package:flutter/material.dart';

import 'loginPage.dart';
import 'homepage.dart';
import 'signuppage.dart';
void main()=> runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.light,
      ),
    home: LoginPage(),
      routes: <String, WidgetBuilder>{
      '/landingpage': (BuildContext contetxt)=> new MyApp(),
        '/signup': (BuildContext context)=> new SignUp(),
        '/homepage':  (BuildContext context)=> new HomePage(),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String phoneNo;
  String smsCode;
  String verification;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

