
import 'package:flutter/material.dart';
import 'package:hungry_flutter/pages/StoreDes/view/StoreDesContentView.dart';
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
import 'package:hungry_flutter/pages/StoreDes/view/StoreDesTypeView.dart';
import 'package:hungry_flutter/tools/evenBus/EvenBusTool.dart';

import 'package:sticky_headers/sticky_headers.dart';
class StoreDes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _StoreDes();

  StoreDes({Key key,this.merchantModel}):super(key:key);

  final HomeMerchantModel merchantModel;

}
class _StoreDes extends State<StoreDes> with SingleTickerProviderStateMixin{

  ScrollController _scrollController = ScrollController();

  int tapIndex = 0;
  /// 商品和评价切换 类型
  bool _foodType = true;
  /// 上次滚动
  double _beforeStuckAmount = 0;
  List<StoreFoodMenuModel> foodModelList = new List();
  @override
  void initState() {
    super.initState();
    networkFoods(context);
    _scrollController.addListener((){
        print(_scrollController.offset); //打印滚动位置
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
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

  foodType(bool type){
   setState(() {
     _foodType = type;
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
                   StoreDesTypeView(foodType),

                  Offstage(
                    offstage: !_foodType,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height-120-50-50,
                            child: Row(
                              children: <Widget>[
                                StoreDesLeftListView(this.foodModelList),
                                Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: new ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: foodModelList.length,
                                    itemBuilder: (BuildContext context,int index){
                                      return new StickyHeaderBuilder(
                                        builder: (BuildContext context, double stuckAmount) {
                                          stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
                                          bool upDown = false;
                                          if(_beforeStuckAmount > stuckAmount){
                                            upDown = true;
                                          }
                                          int upIndex = index;
                                          if(upDown){/// 向下
                                            upIndex = index - 1;
                                          }
                                          _beforeStuckAmount = stuckAmount;

                                          print("stuckAmount$stuckAmount");
                                          if((stuckAmount == 0.0 && upDown || stuckAmount == 1.0 && !upDown) && tapIndex != upIndex){
                                            eventBus.fire(StoreLeftViewEvenBus("刷新index",upIndex));
                                          }
                                          return new Container(
                                            height: 50.0,
                                            color: ColorTool.hexColor("#999999"),
                                            padding: new EdgeInsets.symmetric(horizontal: 16.0),
                                            alignment: Alignment.centerLeft,
                                            child: new Row(
                                              children: <Widget>[
                                                new Text(foodModelList[index].name,
                                                  style: const TextStyle(color: Colors.black54),),
                                                Padding(padding: EdgeInsets.only(left: 10),child: new Text(foodModelList[index].description,
                                                  style: const TextStyle(color: Colors.white,fontSize: 12),),),
                                              ],
                                            ),
                                          );
                                        },
                                        content:StoreDesItemView(foodSectionModel: foodModelList[index],),
                                      );
                                    },
                                  ),),
                              ],),
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: StoreDesFooterView(foodModelList),
                          )
                        ],),
                    ),
                  ),
                   Offstage(
                     offstage: _foodType,
                     child: Container(
                       height: 200,
                       child: Center(
                         child: Text("我不想去写了，你帮我去写吧",style: TextStyle(fontSize: 14,color: Colors.red),),
                       ),
                     ),
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
