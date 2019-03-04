
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hungry_flutter/service/NetworkApi.dart';
import 'package:hungry_flutter/model/HomeTypeModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hungry_flutter/tools/image/ImageTool.dart';
class HomeSwiperWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeSwiperState();
  }

}
class _HomeSwiperState extends State<HomeSwiperWidget>{

  Widget createSwiper(){
   return new Container(
      color: Colors.black,
      height: 200,
      child: new Swiper(
        itemCount: 5,
        itemBuilder: _swiperBuilder,
        scrollDirection: Axis.horizontal,/// 滚动方向
        autoplayDelay: 3000,/// 延时
        autoplayDisableOnInteraction:true,/// 用户拖拽是否停止播放
        duration: 300,/// 动画时间
        control: new SwiperControl(/// 左右两个按钮
          size: 0,
        ),
        autoplay: true,
        pagination: new SwiperPagination(
          alignment:Alignment.bottomCenter,
        ),
        onTap: (index)=>print("点击了$index"),
        scale: 0.9,
        viewportFraction: 0.8,
      ),
    );

  }
  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      "https://static-cdn-test.yangbentong.com/5c41b8edad841d11151027a0_jpeg_thumb.jpg",
      fit: BoxFit.scaleDown,

    ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return createSwiper();
  }

}




class HomeSwiperItemsWidget extends StatefulWidget {

  HomeSwiperItemsWidget({Key key,this.typeModelList}):super(key:key);
  List<List<HomeTypeModel>> typeModelList = new List();

  @override
  State<StatefulWidget> createState() => new _HomeSwiperItemsStatue();

}


class _HomeSwiperItemsStatue extends State<HomeSwiperItemsWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return createUI(context);
  }

  Widget createUI(BuildContext context){
    if(widget.typeModelList.length <= 0){
      return new Container();
    }
    return new Container(
      child: new Swiper(
        outer: false,
        itemBuilder: (c,i){
          return new Wrap(
              runSpacing: 6.0,
              children: widget.typeModelList[i].map((model){
                return SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new SizedBox(
                        child:ImageTool.image(NetworkApi.BaseTypeImgURL+model.image_url),
                        height: MediaQuery.of(context).size.width* 0.12,
                        width: MediaQuery.of(context).size.width* 0.12,
                      ),
                      new Text(model.title,style: new TextStyle(color: Colors.black54,fontSize: 12),)
                    ],
                  ),
                );
              }).toList()
          );
        },
        pagination: new SwiperPagination(builder: new DotSwiperPaginationBuilder(color: Colors.black54)),
        itemCount: widget.typeModelList.length,
      ),
      constraints: new BoxConstraints.loose(new Size(10, 165)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }



}


