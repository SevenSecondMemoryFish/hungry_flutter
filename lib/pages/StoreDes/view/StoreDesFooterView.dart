import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hungry_flutter/tools/color/ColorTool.dart';

class StoreDesFooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
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
                        Text("￥0.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                        Text("配送费5元",style: TextStyle(fontSize: 12,color: Colors.white),)
                      ],)
                  )
                ],
              ),
            ),
          ),
          Container(
            color: ColorTool.hexColor("#535356"),
            width: 120,
            height: 50,
            child: Center(
              child: Text("还差￥20元起送",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
            )
          )
        ],
      ),
    );
  }

}