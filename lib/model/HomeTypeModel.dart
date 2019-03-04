
import 'package:hungry_flutter/service/NetworkApi.dart';

class HomeTypeModel {
  String description;
  String title;
  String link;
  String image_url;
  String icon_url;
  String title_color;
  bool is_in_serving;
  int id;

  static HomeTypeModel fromMap(Map<String, dynamic> map) {
    HomeTypeModel temp = new HomeTypeModel();
    temp.description = map['description'];
    temp.title = map['title'];
    temp.link = map['link'];
    temp.image_url = map['image_url'];
    temp.icon_url = map['icon_url'];
    temp.title_color = map['title_color'];
    temp.is_in_serving = map['is_in_serving'];
    temp.id = map['id'];
    return temp;
  }

  static List<HomeTypeModel> fromMapList(dynamic mapList) {
    List<HomeTypeModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}
