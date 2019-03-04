import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hungry_flutter/service/NetworkApi.dart';
import 'package:hungry_flutter/service/NetworkService.dart';
import 'package:hungry_flutter/pages/home/view/HomeSwiperWidget.dart';
import 'package:hungry_flutter/pages/home/view/HomeItemView.dart';
import 'package:hungry_flutter/model/HomeMerchantModel.dart';
import 'package:hungry_flutter/model/HomeTypeModel.dart';

class Home extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() => new _homeStatus();

}


class _homeStatus extends State<Home> with AutomaticKeepAliveClientMixin{
  List<HomeMerchantModel> _merchantList = new List();

  final HomeSwiperWidget _swiperWidget = new HomeSwiperWidget();

  List<List<HomeTypeModel>> _typeModelList = new List();


  @override
  initState(){
    super.initState();
    hr_network();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      body: new ListView.builder(
        itemCount: 2+_merchantList.length,
        itemBuilder: (BuildContext context,int index){
          if (index == 0){
            return _swiperWidget;
          }else if(index == 1){
            return new HomeSwiperItemsWidget(typeModelList: _typeModelList);;
          }else{
            return new HomeItemView(merchantModel:_merchantList[index-2]);
          }
        },
      ),
    );
  }

  void hr_network(){

    NetworkService.instance.get(NetworkApi.MSITELISTURL, {"limit":"20","offset":"0","latitude":"116.40","longitude":"39.90"}, (data){
      setState(() {
        _merchantList = HomeMerchantModel.fromMapList(data);
      });
    },(e){

    });

    NetworkService.instance.get(NetworkApi.MSITETYPE, null, (data){
      List list = HomeTypeModel.fromMapList(data);
      List<HomeTypeModel> oneList = new List();
      List<HomeTypeModel> twoList = new List();
      list.forEach((value){
        if(oneList.length > 7){
          twoList.add(value);
        }else{
          oneList.add(value);
        }
      });
      setState(() {
        _typeModelList = [oneList,twoList];

      });
    }, (code){

    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}




