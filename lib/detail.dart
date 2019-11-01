
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onefuze/main_.dart';

import 'constants/custom_colors.dart';

class DetailsPage extends StatelessWidget {

  final int type;

  DetailsPage(this.type);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Details',
      theme: ThemeData(
        primarySwatch: MaterialColor(primaryColor, themColors),
      ),
      home: MyDetailsPage(type: this.type,),
    );
  }
}

class MyDetailsPage extends StatefulWidget {
  final int type ;
  MyDetailsPage({Key key,this.type}) : super(key: key);

  @override
  _MyDetailsPageState createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  var items ;
  @override
  void initState() {
    // TODO: implement initState
//    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print(widget.type);

    if(widget.type ==1){
      this.items = MyHomePage.budgetsList;
    }else if(widget.type==2){
      this.items = MyHomePage.spendingList;
    }else if(widget.type==3){
      this.items = MyHomePage.propertyList;
    }else{
      this.items = MyHomePage.goalsList;
    }

    print(items);


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Details'),
      ),
      body:ListView.builder(
          itemCount:items.length,
          itemBuilder: (context,index){
        return ListTile(
          title: Text(items[index]['category']),
          subtitle:Text('Amount \$ '+items[index]['amount']) ,

        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

}
