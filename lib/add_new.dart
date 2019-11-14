

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import 'constants/custom_colors.dart';
import 'login.dart';

class AddBill extends StatefulWidget {
  final isBill;

  AddBill(this.isBill);

  @override
  _AddBillState createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  var nameController=  new TextEditingController();
  var websiteController=  new TextEditingController();

  var amountController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                 hintText: 'Biller Name'
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: websiteController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Website'
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: amountController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Amount'
            ),
          ),
        ),

        Container(
          width: MediaQuery.of(context).size.width-10,
          child: FlatButton(
            color: accentColor,
            child: Text('Submit',style: TextStyle(color: Colors.white),),
            onPressed: () {
             insertBiller(nameController.text,websiteController.text,amountController.text);
            },
          ),
        )
      ],
    );
  }


  insertBiller(name,web,amount) async {
    try {
      // set up POST request arguments
      String url;
      if(widget.isBill)
        url = 'http://onefuze.com/webservice/addbiller.php';
      else
        url = 'http://onefuze.com/webservice/addAmount.php';

      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"USER_ID":"${LoginPage.id}","name":"$name","amount":"$amount","web":"$web"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);

      print(response);

      var body = jsonDecode(response.body);

      print(body);

      setState(() {
        if(body['result']==true) {
          Fluttertoast.showToast(msg: 'Successfully Added');
          Navigator.of(context).pop();
        }
        else
            Fluttertoast.showToast(msg: 'failed to Add');
      });
    } catch (e) {
      print(e);
    }
  }



}
