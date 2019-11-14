import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:onefuze/constants/custom_colors.dart';
import 'package:onefuze/constants/interface.dart';
import 'package:onefuze/model/Money.dart';

import '../add_new.dart';
import '../login.dart';

class BillsPage extends StatefulWidget {
  @override
  _BillsPageState createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage>  {
  List<MoneyModel> list = new List<MoneyModel>();

  var data ;

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(data==null) return Text('');


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
              'Add Bill',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBill(true)),
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
      String url = 'http://onefuze.com/webservice/fetchbills.php';
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
