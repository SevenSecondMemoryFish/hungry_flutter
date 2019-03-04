
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hungry_flutter/model/HomeMerchantModel.dart';
import 'package:hungry_flutter/service/NetworkApi.dart';
import 'package:hungry_flutter/tools/image/ImageTool.dart';
class StoreDesHeadView extends StatelessWidget{

  final HomeMerchantModel model;
  const StoreDesHeadView({Key key,this.model}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      fit: StackFit.loose,
      children: <Widget>[
        new Positioned(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: ImageTool.image(NetworkApi.BaseImgURL + model.image_path)
            )
        ),
        BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: new Container(
            color: Color.fromRGBO(119, 103,137,0.43),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
          ),
        ),
        new Positioned(
            left: 0,
            top: 30,
            width: MediaQuery.of(context).size.width,
            child: new Column(
              children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: ClipRRect(
                        child:ImageTool.image(NetworkApi.BaseImgURL + model.image_path,fit: BoxFit.cover) ,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )
                    ),
                    new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: new Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(model.name,style: new TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.white),),
                                    new Padding(padding: EdgeInsets.only(top: 8),child: new Text("商家配送 / 分钟送达 / 配送费￥"+model.float_delivery_fee.toString(),style: new TextStyle(fontSize: 12,color: Colors.white),),),
                                    new Padding(padding: EdgeInsets.only(top: 8),child: new Text("公告:"+model.promotion_info,style: new TextStyle(fontSize: 12,color: Colors.white),),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10),child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),)

                          ],
                        ))
                  ],
                )
              ],
            )
        ),
        Positioned(
            top: 15,
            width: 30,
            height: 30,
            child: GestureDetector(onTap: (){
              Navigator.pop(context);
            },child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),))

      ],
    );
  }

}
