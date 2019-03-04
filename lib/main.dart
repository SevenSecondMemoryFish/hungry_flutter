import 'package:flutter/material.dart';

import 'package:hungry_flutter/pages/home/Home.dart';
import 'package:hungry_flutter/pages/order/OrderList.dart';
import 'package:hungry_flutter/pages/user/UserProfile.dart';
void main() => runApp(HungryApp());

class HungryApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HungryState();
  }

}
class HungryState extends State<HungryApp> with SingleTickerProviderStateMixin{

  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
//    super.initState();
    _tabController =  TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.blueAccent,
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new Home(),
            new OrderList(),
            new UserProfile()
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.white10,
          child: new TabBar(
              indicatorWeight:0.1,
              controller: _tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black26,
              tabs: [
                new Tab(
                  child: Column(
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.only(top: 5),child: new Text("外卖",style: new TextStyle(fontSize: 12))),
                      new Icon(Icons.account_balance,size: 20,)
                    ],
                  ),
                ),
                new Tab(
                  child: Column(
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.only(top: 5),child: new Text("订单",style: new TextStyle(fontSize: 12))),
                      new Icon(Icons.favorite,size: 20,)
                    ],
                  ),
                ),
                new Tab(
                  child: Column(
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.only(top: 5),child: new Text("我的",style: new TextStyle(fontSize: 12))),
                      new Icon(Icons.usb,size: 20,)
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }

}

