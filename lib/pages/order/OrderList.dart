import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child:    Container(
        width: 80,
        color: Colors.amber,
        child: new ListView.builder(
          itemCount: 20,
          itemExtent: 30,
          itemBuilder: (BuildContext context,int index){
            return Container(color: Colors.redAccent,child: Text("$index"),);
          },
        ),),
    );
  }

}