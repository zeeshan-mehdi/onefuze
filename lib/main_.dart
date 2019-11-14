import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:onefuze/detail.dart';

import 'constants/custom_colors.dart';
import 'login.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneFuze',
      theme: ThemeData(
        primarySwatch: MaterialColor(primaryColor, themColors),
      ),
      home: MyHomePage(title: 'OneFuze'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static var budgetsList;

  static var spendingList;

  static var goalsList;

  static var propertyList;

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var budgets = "loading ...";
  var spending = "loading ...";

  var goal = "loading ...";

  var property = "loading ...";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOverviewInfo();
    fetchBudgets();
    fetchProperty();
    fetchGoals();
    fetchSpending();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Text(
                    'Overview',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0, top: 16),
                    child: Align(
                      child: Text(
                        'Budgets              \S $budgets',
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        'Spendings          \$ $spending',
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        'Property              \S $property',
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        'Goal                     \S $goal',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Text(
                    'Budget',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0, top: 16),
                    child: Align(
                      child: Text(
                        'Budgets              \S $budgets',
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Align(
                    child: Padding(
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 90),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white70)),
                              color: Colors.white70,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(1),
                                    ));
                              },
                              child: const Text(
                                "Details",
                                style: TextStyle(
                                    color: Color.fromRGBO(39, 34, 100, 1)),
                              ))),
                      padding: EdgeInsets.all(8),
                    ),
                    alignment: Alignment.bottomRight,
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Text(
                    'Spending',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        'Spendings          \$ $spending',
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Align(
                    child: Padding(
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 90),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white70)),
                              color: Colors.white70,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(2),
                                    ));
                              },
                              child: const Text(
                                "Details",
                                style: TextStyle(
                                    color: Color.fromRGBO(39, 34, 100, 1)),
                              ))),
                      padding: EdgeInsets.all(8),
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Text(
                    'Property',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        'Property              \S $property',
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Align(
                    child: Padding(
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 90),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white70)),
                              color: Colors.white70,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(3),
                                    ));
                              },
                              child: const Text(
                                "Details",
                                style: TextStyle(
                                    color: Color.fromRGBO(39, 34, 100, 1)),
                              ))),
                      padding: EdgeInsets.all(8),
                    ),
                    alignment: Alignment.bottomRight,
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Text(
                    'Goal',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        'Goal                     \S $goal',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Align(
                    child: Padding(
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 90),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white70)),
                              color: Colors.white70,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(4),
                                    ));
                              },
                              child: const Text(
                                "Details",
                                style: TextStyle(
                                    color: Color.fromRGBO(39, 34, 100, 1)),
                              ))),
                      padding: EdgeInsets.all(8),
                    ),
                    alignment: Alignment.bottomRight,
                  )
                ],
              ),
            ),
          ],

    ));
  }

  fetchOverviewInfo() async {
    try {
      // set up POST request arguments
      String url = 'http://onefuze.com/webservice/fetchAllInfo.php';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"USER_ID":"${LoginPage.id}"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);

      var body = jsonDecode(response.body);

      print(body);

      setState(() {
        this.budgets = body["budgets"];
        this.spending = body["spending"];
        this.property = body["property"];
        this.goal = body["goal"];
      });
    } catch (e) {
      print(e);
    }
  }

  fetchBudgets() async {
    try {
      // set up POST request arguments
      String url = 'http://onefuze.com/webservice/budgets.php';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"USER_ID":"${LoginPage.id}"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);

      var body = jsonDecode(response.body);



      setState(() {
        MyHomePage.budgetsList = body["budgets"];
        print(MyHomePage.budgetsList[0]['amount']);
      });

    } catch (e) {
      print(e);
    }
  }

  fetchSpending() async {
    try {
      // set up POST request arguments
      String url = 'http://onefuze.com/webservice/spending.php';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"USER_ID":"${LoginPage.id}"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);

      var body = jsonDecode(response.body);

      print(body);

      setState(() {
        MyHomePage.spendingList = body["spending"];
      });
    } catch (e) {
      print(e);
    }
  }

  fetchGoals() async {
    try {
      // set up POST request arguments
      String url = 'http://onefuze.com/webservice/goals.php';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"USER_ID":"${LoginPage.id}"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);

      var body = jsonDecode(response.body);

      setState(() {
        MyHomePage.goalsList = body["goals"];
      });
    } catch (e) {
      print(e);
    }
  }

  fetchProperty() async {
    try {
      // set up POST request arguments
      String url = 'http://onefuze.com/webservice/property.php';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"USER_ID":"${LoginPage.id}"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);

      var body = jsonDecode(response.body);

      print(body);

      setState(() {
        MyHomePage.propertyList = body["property"];
      });
    } catch (e) {
      print(e);
    }
  }
}
