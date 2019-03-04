
import 'package:flutter/material.dart';
import 'package:hungry_flutter/tools/MyAppBar/MyAppBar.dart';
import 'package:hungry_flutter/pages/StoreDes/view/StoreDesHeadView.dart';
import 'package:hungry_flutter/pages/StoreDes/view/StoreDesItemView.dart';
import 'package:hungry_flutter/pages/StoreDes/view/StoreDesFooterView.dart';
import 'package:hungry_flutter/model/HomeMerchantModel.dart';
import 'package:hungry_flutter/service/NetworkApi.dart';
import 'package:hungry_flutter/service/NetworkService.dart';
import 'package:hungry_flutter/model/StoreFoodModel.dart';
import 'package:hungry_flutter/model/StoreFoodMenuModel.dart';
import 'package:hungry_flutter/tools/color/ColorTool.dart';

class StoreDes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _StoreDes();

  StoreDes({Key key,this.merchantModel}):super(key:key);

  final HomeMerchantModel merchantModel;
  
}
class _StoreDes extends State<StoreDes> with SingleTickerProviderStateMixin{


  ScrollController _scrollController = ScrollController();

  int tapIndex = 0;
  List<StoreFoodMenuModel> foodModelList = new List();
  @override
  void initState() {
    super.initState();
    networkFoods(context);
    _scrollController.addListener((){
        print(_scrollController.offset); //打印滚动位置
    });
  }

  void networkFoods(BuildContext context){
    
    NetworkService.instance.get(NetworkApi.SHOPFOODMENU, {"restaurant_id":widget.merchantModel.id.toString()}, (data){
      setState(() {
        foodModelList = StoreFoodMenuModel.fromMapList(data);
      });
    }, (error){

    });
    
    String url = NetworkApi.STODEFOODURL + widget.merchantModel.id.toString()+"/ratings";
    NetworkService.instance.get(url, {"latitude":widget.merchantModel.latitude.toString(),"longitude":widget.merchantModel.longitude.toString()}, (data){


    }, (error){

    });
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Positioned(child: new StoreDesHeadView(model:widget.merchantModel)),
          new Positioned(
              top: 120,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-120,
              child:new Container(
               color: Colors.white,
               child:  new Column(
                 children: <Widget>[
                  new Container(
                    height: 50,
                    color: Colors.blue,
                    child:  new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[new Text("商品",style: new TextStyle(fontSize: 14),),new Container(color: Colors.red,height: 2,width: 30,margin: EdgeInsets.only(top: 5),),],
                          ),
                            new Column(
                              mainAxisSize: MainAxisSize.min,
                                children: <Widget>[new Text("评价",style: new TextStyle(fontSize: 14)),new Container(color: Colors.red,height: 2,width: 30,margin: EdgeInsets.only(top: 5)),],
                          )
                        ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height-120-50-50,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 80,
                                padding: EdgeInsets.all(0),
                                child: new ListView.separated(
                                  padding: EdgeInsets.all(0),
                                  addRepaintBoundaries:false,
                                  itemCount: foodModelList.length,
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
                                        Expanded(child:Padding(padding: EdgeInsets.only(left: 5),child:  Text(foodModelList[index].name,overflow: TextOverflow.clip,maxLines: 1,),),)
                                      ],
                                    ),),);
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Divider(color: Colors.grey,height: 1,);
                                  },
                                ),),
                              Container(
                                width: MediaQuery.of(context).size.width - 80,
                                child: new ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  itemCount: foodModelList.length,
                                  controller: _scrollController,
                                  itemBuilder: (BuildContext context,int index){
                                    return StoreDesItemView(foodSectionModel: foodModelList[index],);
                                  },
                                ),),
                          ],),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: StoreDesFooterView(),
                        )
                      ],),
                  )
                 ],
               ),
             )
           ),
        ]
      )
    );
  }

  int hr_dealWithItem(){
    int count = 0;
    foodModelList.forEach((model){

    });
    return count;
  }
}