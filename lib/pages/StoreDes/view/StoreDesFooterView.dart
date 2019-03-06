import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hungry_flutter/tools/color/ColorTool.dart';
import 'package:hungry_flutter/model/StoreFoodMenuModel.dart';
import 'package:hungry_flutter/pages/StoreDes/view/StoreDesItemView.dart';
import 'package:hungry_flutter/tools/evenBus/EvenBusTool.dart';
class StoreDesFooterView extends StatefulWidget {

  StoreDesFooterView(this._menuModelList,{Key key}):super(key:key);
  List<StoreFoodMenuModel> _menuModelList = new List();

  int getBuyTotalPrice(){
    int total = 0;
    _menuModelList.forEach((menuModel){
      menuModel.foods.forEach((model){
        total = model.buyNumber*20+total;
      });
    });
    return total;
  }
  @override
  State<StatefulWidget> createState()=>_StoreDesFooterState();

}

class _StoreDesFooterState extends State<StoreDesFooterView>{

  @override
  void initState(){
    super.initState();
    eventBus.on<StoreDesEvenBus>().listen((StoreDesEvenBus even){
      setState(() {
        widget._menuModelList = widget._menuModelList;
      });
    });
  }
  Widget createBuyWidge(){
    int price = widget.getBuyTotalPrice();
    if(price>0){
      return Container(
          color: ColorTool.hexColor("#4cd964"),
          width: 120,
          height: 50,
          child: Center(
            child: Text("去结算",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
          )
      );
    }else{
      return Container(
          color: ColorTool.hexColor("#535356"),
          width: 120,
          height: 50,
          child: Center(
            child: Text("还差￥20元起送",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          Expanded(
            child: new Container(
              color: ColorTool.hexColor("#333333"),
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child:Image.asset("assets/images/shop_car_na.png",width: 40,height: 40,fit: BoxFit.cover,),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10),child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("￥"+ widget.getBuyTotalPrice().toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                      Text("配送费5元",style: TextStyle(fontSize: 12,color: Colors.white),)
                    ],)
                  )
                ],
              ),
            ),
          ),
          createBuyWidge(),
        ],
      ),
    );
  }
}

