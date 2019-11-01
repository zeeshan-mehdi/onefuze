import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onefuze/constants/custom_colors.dart';
import 'package:onefuze/login.dart';
import 'package:onefuze/main_.dart';

void main() => runApp(LoginScreen());

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(primaryColor,themColors),
      ),
      home: MySplashPage(title: 'Flutter Demo Home Page'),

      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
        '/home': (BuildContext context) => MyApp(),
      },
    );
  }
}

class MySplashPage extends StatefulWidget {
  MySplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySplashPageState createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Center(
        child:Padding( child: Image.asset('images/onefuze_logo.jpeg'),padding: EdgeInsets.only(left: 10,right: 10),),

      ),),
      backgroundColor: Color.fromRGBO( 39,34,100,1),
    );
  }





}
