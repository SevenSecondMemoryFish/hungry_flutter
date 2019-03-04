



class HomeMerchantModel {

  String name;
  String address;
  String phone;
  String category;
  String promotion_info;
  String image_path;
  String distance;
  String order_lead_time;
  String description;
  bool is_new;
  bool is_premium;
  double latitude;
  double longitude;
  String rating;
  int id;
  int status;
  String recent_order_num;
  int rating_count;
  int float_minimum_order_amount;
  int float_delivery_fee;
  String agent_fee;
  List<double> location;
  String delivery_mode;

  static HomeMerchantModel fromMap(Map<String, dynamic> map) {
    HomeMerchantModel temp = new HomeMerchantModel();
    temp.name = map['name'];
    temp.address = map['address'];
    temp.phone = map['phone'];
    temp.category = map['category'];
    temp.promotion_info = map['promotion_info'];
    temp.image_path = map['image_path'];
    temp.distance = map['distance'];
    temp.order_lead_time = map['order_lead_time'];
    temp.description = map['description'];
    temp.is_new = map['is_new'];
    temp.is_premium = map['is_premium'];
    temp.latitude = map['latitude'];
    temp.longitude = map['longitude'];
    temp.rating = map['rating'].toString();
    temp.id = map['id'];
    temp.status = map['status'];
    temp.recent_order_num = map['recent_order_num'].toString();
    temp.rating_count = map['rating_count'];
    temp.float_minimum_order_amount = map['float_minimum_order_amount'];
    temp.float_delivery_fee = map['float_delivery_fee'];
    temp.agent_fee =map['piecewise_agent_fee']['tips'];
    temp.delivery_mode = map["delivery_mode"]["text"];
    List<dynamic> dynamicList0 = map['location'];
    temp.location = new List();
    temp.location.addAll(dynamicList0.map((o) => double.parse(o.toString())));

    return temp;
  }

  static List<HomeMerchantModel> fromMapList(dynamic mapList) {
    List<HomeMerchantModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}


