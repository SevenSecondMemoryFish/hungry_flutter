

import 'package:flutter/material.dart';
class StoreDesTypeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> _StoreDesTypeView();

  ValueChanged<bool> _valueChanged;

  StoreDesTypeView(this._valueChanged);

}
class _StoreDesTypeView extends State<StoreDesTypeView>{

  bool _foodType = true;

  onTap(bool type){
    widget._valueChanged(type);
    setState(() {
      _foodType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 50,
      color: Colors.blue,
      child:  new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: ()=>onTap(true),
            child: new Container(
              decoration:BoxDecoration(
                border: Border(bottom: BorderSide(color: _foodType ? Colors.red:Colors.blue,width: 2)),
              ),
              padding:EdgeInsets.only(bottom: 5),
              child: Text("商品",style: new TextStyle(fontSize: 14,color: _foodType ? Colors.red:Colors.white),),),
          ),
          GestureDetector(
            onTap: ()=>onTap(false),
            child: new Container(
              decoration:BoxDecoration(
                border: Border(bottom: BorderSide(color: !_foodType ? Colors.red:Colors.blue,width: 2)),
              ),
              padding:EdgeInsets.only(bottom: 5),
              child: Text("评价",style: new TextStyle(fontSize: 14,color: !_foodType ? Colors.red:Colors.white),),),
          ),
        ],
      ),
    );
  }

}
