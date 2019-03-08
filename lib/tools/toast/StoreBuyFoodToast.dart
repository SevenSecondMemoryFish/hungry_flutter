import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hungry_flutter/pages/StoreDes/view/StoreDesItemView.dart';
import 'package:hungry_flutter/model/StoreFoodMenuModel.dart';
import 'package:hungry_flutter/tools/color/ColorTool.dart';
class StoreBuyFoodToast{

  static  show  ({@required BuildContext context, @required List<FoodModel> modelList}) async{
   OverlayEntry overlayEntry;
   overlayEntry = OverlayEntry(builder: (context){
      return  Opacity(
        opacity: 0.2,
        alwaysIncludeSemantics:false,
        child: Container(
          color: Colors.blue,
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    createHeadView(),
                    Container(
                      height: 120,
                      child: ListView.builder(
                        itemCount: 10,
                        itemExtent: 80.0,
                        itemBuilder: (context,index){
                          return Container(color: Colors.red,child: createListItem(modelList[index]),);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
    Overlay.of(context).insert(overlayEntry);

    await Future.delayed(Duration(milliseconds: 3500));
    overlayEntry.remove();

  }

  static Widget createHeadView(){

    return Container(
      color: Colors.blue,
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("购物车",style: TextStyle(color: Colors.grey,fontSize: 12),),

        ],
      ),
    );
  }

  static Widget createListItem(FoodModel model){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(child: Text("2222"),),
        Container(
          child:Row(
            children: <Widget>[
              Text("￥230"),
              ShopCarAddOrLessView(model),
            ],
          ),
        )

      ],
    );
  }

}
