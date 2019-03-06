import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hungry_flutter/service/NetworkApi.dart';
import 'package:hungry_flutter/model/StoreFoodMenuModel.dart';
import 'package:hungry_flutter/tools/color/ColorTool.dart';
import 'package:hungry_flutter/tools/image/ImageTool.dart';
import 'package:hungry_flutter/tools/evenBus/EvenBusTool.dart';
class StoreDesItemView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StoreDesItemStatus();


  StoreFoodMenuModel foodSectionModel;

  StoreDesItemView({Key key,this.foodSectionModel}):super(key:key);

}

class _StoreDesItemStatus extends State<StoreDesItemView>{

  @override
  Widget build(BuildContext context) {
    if(widget.foodSectionModel.foods.length <=0) return Text("");
    return ExpansionTile(
      title:Text(widget.foodSectionModel.name,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
      initiallyExpanded: true,
      children:  widget.foodSectionModel.foods.map((model){
        return createItem(model);
      }).toList(),
    );
  }

  Widget createItem(FoodModel foodModel){
    return  Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(5)),child: ImageTool.image( NetworkApi.BaseImgURL+foodModel.image_path),)
        ),
        Expanded(
            child:Padding(padding: EdgeInsets.only(left: 10),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(foodModel.name,style: TextStyle(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.bold),),
                Text(foodModel.description,style: TextStyle(fontSize: 12,color: Colors.black54),),
                Padding(padding: EdgeInsets.only(top: 3),child: Text("月售"+foodModel.month_sales +" 好评率" + foodModel.satisfy_rate,style: TextStyle(fontSize: 12,color: Colors.black87)),),
                FoodAttributesView(foodModel: foodModel,),
                FoodSelectView(foodModel),
              ],
            ),)
        )
      ],
    );
  }

}
class FoodAttributesView extends StatelessWidget {

  FoodModel foodModel;
  FoodAttributesView({this.foodModel,Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: foodModel.activity.image_text == null,
      child: Container(
        padding: EdgeInsets.only(left: 5,right: 5),
        decoration: BoxDecoration(
          border: Border.all(color: ColorTool.hexColor(foodModel.activity.icon_color),width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child:Text(foodModel.activity.image_text ?? "",style: TextStyle(fontSize: 12,color: ColorTool.hexColor(foodModel.activity.icon_color) ?? Colors.red),),
      ),
    );



//      Container(
//      margin: EdgeInsets.only(top: 3),
//      height: foodModel.attributes.length > 0  ? 20 : 0,
//      child: GridView.builder(
//          padding: EdgeInsets.all(0),
//          physics: NeverScrollableScrollPhysics(),
//          itemCount: foodModel.attributes.length,
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//              crossAxisCount: 5, //每行三列
//              crossAxisSpacing: 5,
//              childAspectRatio: 2.5
//
//          ),
//          itemBuilder: (context, index) {
//            return Container(
//              height: 20,
//              decoration: BoxDecoration(
//                border: Border.all(color: Colors.red,width: 1.0),
//                borderRadius: BorderRadius.all(Radius.circular(10)),
//              ),
//              child:Center(child:  Text(foodModel.attributes[index].icon_name,style: TextStyle(fontSize: 12),)),
//            );
//          }),
//    );
  }
}
class FoodSelectView extends StatefulWidget {

  FoodSelectView(this._foodModel,{Key key}):super(key:key);

  FoodModel _foodModel;
  @override
  State<StatefulWidget> createState() => _FoodSelectView();

}

class _FoodSelectView extends State<FoodSelectView>{
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("￥20",style: TextStyle(color: Colors.redAccent,fontSize: 14,fontWeight: FontWeight.bold),),
        Row(
          children: <Widget>[
            Offstage(
              offstage: widget._foodModel.buyNumber <= 0,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      sendNotification(context);
                      setState(() {
                        widget._foodModel.buyNumber = widget._foodModel.buyNumber - 1;
                      });
                    },
                    child: Image.asset("assets/images/reduction@2x.png",width: 28,height: 28,),
                  ),
                  Container(
                    width: 30,
                    child: Text(widget._foodModel.buyNumber.toString(),style: TextStyle(fontSize: 12,color: Colors.grey,),textAlign: TextAlign.center,),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                sendNotification(context);
                setState(() {
                  widget._foodModel.buyNumber = widget._foodModel.buyNumber + 1;
                });
              },
              child: Image.asset("assets/images/add@2x.png",width: 30,height: 30,),
            )

          ],
        ),
//        Image.asset("assets/images/add@2x.png",width: 30,height: 30,),

      ],
    );
  }

  void sendNotification(BuildContext context){
    print("send");
    eventBus.fire(StoreDesEvenBus("send"));
    FoodNumberNotification("Hi").dispatch(context);
  }


}

class FoodNumberNotification extends Notification {
  FoodNumberNotification(this.msg);
  final String msg;
}


