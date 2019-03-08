import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hungry_flutter/model/StoreFoodMenuModel.dart';
import 'package:hungry_flutter/tools/color/ColorTool.dart';
import 'package:hungry_flutter/tools/evenBus/EvenBusTool.dart';

class StoreDesLeftListView extends StatefulWidget{
  StoreDesLeftListView(this.foodModelList,{Key key}):super(key:key);
  List<StoreFoodMenuModel> foodModelList = new List();

  @override
  State<StatefulWidget> createState() =>_StoreDesLeftListViewState();

}

class _StoreDesLeftListViewState extends State<StoreDesLeftListView>{

  int tapIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventBus.on<StoreLeftViewEvenBus>().listen((StoreLeftViewEvenBus even){
      setState(() {
        tapIndex = even.tapIndex;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      width: 80,
      padding: EdgeInsets.all(0),
      child: new ListView.separated(
        padding: EdgeInsets.all(0),
        addRepaintBoundaries:false,
        itemCount: widget.foodModelList.length,
        itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              setState(() {
                tapIndex = index;
              });
            },
            behavior:HitTestBehavior.translucent,
            child: Container(
              width: 80,
              height: 50,
              color: index == tapIndex ? Colors.white:ColorTool.hexColor("#f5f5f5"),
              child: Row(
                children: <Widget>[
                  Container(color: index == tapIndex ? Colors.red:ColorTool.hexColor("#f5f5f5"),width: 2,height: 50,),
                  Expanded(child:Padding(padding: EdgeInsets.only(left: 5),child:  Text(widget.foodModelList[index].name,overflow: TextOverflow.clip,maxLines: 1,),),)
                ],
              ),),);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.grey,height: 1,);
        },
      ),);
  }

}

