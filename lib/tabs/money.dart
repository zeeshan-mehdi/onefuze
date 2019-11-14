import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:onefuze/constants/custom_colors.dart';

import '../add_new.dart';
import '../login.dart';

class MoneyPage extends StatefulWidget {
  @override
  _MoneyPageState createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  var data;

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (data == null) return Text('');
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(data[index]['name']),
                subtitle: Text(data[index]['amount'].toString()),
                leading: Icon(Icons.attach_money),
              );
            }),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 10,
          child: FlatButton(
            color: accentColor,
            child: Text(
              'Add Money',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBill(false)),
              );
            },
          ),
        ),
      ],
    );
  }

  void fetchData() async {
    try {
      // set up POST request arguments
      String url = 'http://onefuze.com/webservice/fetchmoney.php';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"USER_ID":"${LoginPage.id}"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);

      var body = jsonDecode(response.body);

      print(body);

      setState(() {
        data = body['bills'];
      });
    } catch (e) {
      print(e);
    }
  }
}
