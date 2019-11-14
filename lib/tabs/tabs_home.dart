import 'package:flutter/material.dart';
import 'package:onefuze/add_new.dart';
import 'package:onefuze/constants/custom_colors.dart';
import 'package:onefuze/main_.dart';
import 'package:onefuze/tabs/money.dart';

import 'bills.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(39, 34, 100, 1),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.payment),
                  text: 'Bills',
                ),
                Tab(
                  icon: Icon(Icons.monetization_on),
                  text: 'Money',
                ),
                Tab(
                  icon: Icon(Icons.business),
                  text: 'Budget',
                ),
              ],
              indicatorColor: Color.fromRGBO(39, 34, 100, 1),
            ),
            title: Text('Onefuze'),
          ),
          body: TabBarView(
            children: [
              MaterialApp(home: BillsPage()),
              MaterialApp(home: MoneyPage()),
              MyHomePage(
                title: 'Budget',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
