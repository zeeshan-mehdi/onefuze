import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:onefuze/main_.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants/custom_colors.dart';



class LoginScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneFuze',
      theme: ThemeData(
        primarySwatch: MaterialColor(primaryColor, themColors),
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MyApp(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  static String id = "1";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OneFuze'),
      ),
      body: Form(
        key: _formKey,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login To OneFuze',
              style: TextStyle(
                  color: Color.fromRGBO(39, 34, 100, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Container(
              height: 50,
            ),
            Padding(
              child: TextFormField(
                controller: _emailController,
                decoration: new InputDecoration(
                  labelText: "Eneter Email Address",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "email cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              padding: EdgeInsets.all(8),
            ),
            Padding(
              child: TextFormField(
                controller: _passwordController,
                decoration: new InputDecoration(
                  labelText: "Enter password",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "password cannot be empty";
                  } else {
                    return null;
                  }
                },
              ),
              padding: EdgeInsets.all(8),
            ),
            Padding(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Color.fromRGBO(39, 34, 100, 1))),
                      color: Color.fromRGBO(39, 34, 100, 1),
                      onPressed: signIn,
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ))),
              padding: EdgeInsets.all(8),
            )
          ],
        ),
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      try {
        var email = _emailController.text;
        var password = _passwordController.text;

        // set up POST request arguments
        String url = 'http://onefuze.com/webservice/login.php';
        Map<String, String> headers = {"Content-type": "application/json"};
        String json = '{"EMAIL":"$email","PASSWORD":"$password"}';
        // make POST request
        Response response = await post(url, headers: headers, body: json);

        var body = jsonDecode(response.body);

        print(body);

        if (body['status'] == "1") {
           LoginPage.id = body['id'];
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          Fluttertoast.showToast(msg: 'Unable To Login Check Credentials And Try Again',toastLength: Toast.LENGTH_LONG);
        }
      } catch (e) {
        print(e);
      }
    } else {
      return;
    }
  }
}
