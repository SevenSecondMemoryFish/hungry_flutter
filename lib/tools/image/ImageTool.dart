
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageTool {

  static Widget image(String imageUrl,{BoxFit fit = BoxFit.fill}){
    return CachedNetworkImage(placeholder:(context,plo)=> Image.asset("assets/images/loding.gif"),imageUrl: imageUrl,fit: fit,);
  }

}
