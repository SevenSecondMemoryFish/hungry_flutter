import 'package:flutter/material.dart';
import 'package:hungry_flutter/service/NetworkApi.dart';
import 'package:hungry_flutter/model/HomeMerchantModel.dart';
import 'package:hungry_flutter/pages/StoreDes/StoreDes.dart';
import 'package:hungry_flutter/tools/image/ImageTool.dart';
class HomeItemView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeItemViewStatus();

  HomeItemView({Key key, this.merchantModel}):super(key:key);

  final HomeMerchantModel merchantModel;

}

class _HomeItemViewStatus extends State<HomeItemView> {

  Widget createOrderNum(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(top: 5),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
         new Row(
           children: <Widget>[
             new Text("积分为"+widget.merchantModel.rating,
                 style: new TextStyle(color: Colors.red, fontSize: 12)),
             new Padding(padding: const EdgeInsets.only(left: 10),child:  new Text("月销售"+widget.merchantModel.recent_order_num+"单",
                 style: new TextStyle(color: Colors.black26, fontSize: 12)),)
           ],
         ),
         new DecoratedBox(
           decoration: new BoxDecoration(
             color: Colors.blueAccent,
             borderRadius: BorderRadius.circular(4)
           ),
           child:  new Padding(
             padding: const EdgeInsets.only(left: 4,right: 4),
             child: new Text(
               widget.merchantModel.delivery_mode,
               style: new TextStyle(color: Colors.white,fontSize: 10),),),
         )
        ],
      ),
    );
  }

  Widget createDistance(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.only(top: 5),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(widget.merchantModel.agent_fee,
                style: new TextStyle(color: Colors.black26, fontSize: 10)),
            new Text(widget.merchantModel.distance + "/" + widget.merchantModel.order_lead_time,
                style: new TextStyle(color: Colors.black26, fontSize: 10))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder:(context)=>new StoreDes(merchantModel:widget.merchantModel)));
      },
      behavior:HitTestBehavior.translucent,
      child: new Padding(
          padding: const EdgeInsets.all(5),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                  width: 80,
                  height: 80,
                  child: ImageTool.image(NetworkApi.BaseImgURL + widget.merchantModel.image_path,
                      fit: BoxFit.cover)
                      ),
              new Expanded(
                  child: new Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: new Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: new Text(widget.merchantModel.name,
                                style: new TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                          createOrderNum(context),
                          createDistance(context),
                        ],
                      )))
            ],
          )),
    );
  }
}
