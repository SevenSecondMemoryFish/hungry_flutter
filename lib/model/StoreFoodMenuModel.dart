

class StoreFoodMenuModel {

  String name;
  String description;
  String icon_url;
  bool is_selected;
  int id;
  int restaurant_id;
  int type;
  List<FoodModel> foods;

  static StoreFoodMenuModel fromMap(Map<String, dynamic> map) {
    StoreFoodMenuModel temp = new StoreFoodMenuModel();
    temp.name = map['name'];
    temp.description = map['description'];
    temp.icon_url = map['icon_url'];
    temp.is_selected = map['is_selected'];
//    temp.id = map['id'];
//    temp.restaurant_id = map['restaurant_id'];
//    temp.type = map['type'];
    temp.foods = FoodModel.fromMapList(map['foods']);
    return temp;
  }

  static List<StoreFoodMenuModel> fromMapList(dynamic mapList) {
    if(mapList == null)return new List();
    List<StoreFoodMenuModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class FoodModel {
  String _id;
  String tips;
  String image_path;
  String name;
  String server_utc;
  String description;
  String pinyin_name;
  String is_essential;
  String rating;
  String item_id;
  String category_id;
  String restaurant_id;
  String satisfy_rate;
  String satisfy_count;
  String rating_count;
  String month_sales;
  String is_featured;
  int buyNumber = 0;
  ActivityBean activity;
  List<AttributesListBean> attributes;
  List<SpecfoodsListBean> specfoods;

  static FoodModel fromMap(Map<String, dynamic> map) {
    FoodModel foodsListBean = new FoodModel();
    foodsListBean._id = map['_id'];
    foodsListBean.tips = map['tips'];
    foodsListBean.image_path = map['image_path'];
    foodsListBean.name = map['name'];
    foodsListBean.server_utc = map['server_utc'];
    foodsListBean.description = map['description'];
    foodsListBean.pinyin_name = map['pinyin_name'];
    foodsListBean.is_essential = map['is_essential'].toString();
    foodsListBean.rating = map['rating'].toString();
    foodsListBean.item_id = map['item_id'].toString();
    foodsListBean.category_id = map['category_id'].toString();
    foodsListBean.restaurant_id = map['restaurant_id'].toString();
    foodsListBean.satisfy_rate = map['satisfy_rate'].toString();
    foodsListBean.satisfy_count = map['satisfy_count'].toString();
    foodsListBean.rating_count = map['rating_count'].toString();
    foodsListBean.month_sales = map['month_sales'].toString();
    foodsListBean.is_featured = map['is_featured'].toString();
    foodsListBean.activity = ActivityBean.fromMap(map['activity']);
    foodsListBean.attributes = AttributesListBean.fromMapList(map['attributes']);
    foodsListBean.specfoods = SpecfoodsListBean.fromMapList(map['specfoods']);
    return foodsListBean;
  }

  static List<FoodModel> fromMapList(dynamic mapList) {
    if(mapList == null)return new List();
    List<FoodModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class ActivityBean {
  String image_text;
  String icon_color;
  String image_text_color;

  static ActivityBean fromMap(Map<String, dynamic> map) {
    if (map == null || map.length<=0)return new ActivityBean();
    ActivityBean activityBean = new ActivityBean();
    activityBean.image_text = map['image_text'];
    activityBean.icon_color = map['icon_color'];
    activityBean.image_text_color = map['image_text_color'];
    return activityBean;
  }

  static List<ActivityBean> fromMapList(dynamic mapList) {
    if(mapList == null)return new List();
    List<ActivityBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class AttributesListBean {
  String icon_name;
  String icon_color;

  static AttributesListBean fromMap(Map<String, dynamic> map) {
    AttributesListBean attributesListBean = new AttributesListBean();
    attributesListBean.icon_name = map['icon_name'];
    attributesListBean.icon_color = map['icon_color'];
    return attributesListBean;
  }

  static List<AttributesListBean> fromMapList(dynamic mapList) {
    if(mapList == null)return new List();
    List<AttributesListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class SpecfoodsListBean {
  String specs_name;
  String name;
  String _id;
  String pinyin_name;
  bool is_essential;
  bool sold_out;
  String recent_rating;
  int item_id;
  int sku_id;
  int food_id;
  int restaurant_id;
  int stock;
  int checkout_mode;
  int recent_popularity;
  int price;
  int promotion_stock;
  int packing_fee;
  int original_price;

  static SpecfoodsListBean fromMap(Map<String, dynamic> map) {
    SpecfoodsListBean specfoodsListBean = new SpecfoodsListBean();
    specfoodsListBean.specs_name = map['specs_name'];
    specfoodsListBean.name = map['name'];
    specfoodsListBean._id = map['_id'];
    specfoodsListBean.pinyin_name = map['pinyin_name'];
    specfoodsListBean.is_essential = map['is_essential'];
    specfoodsListBean.sold_out = map['sold_out'];
    specfoodsListBean.recent_rating = map['recent_rating'].toString();
//    specfoodsListBean.item_id = map['item_id'];
//    specfoodsListBean.sku_id = map['sku_id'];
//    specfoodsListBean.food_id = map['food_id'];
//    specfoodsListBean.restaurant_id = map['restaurant_id'];
//    specfoodsListBean.stock = map['stock'];
//    specfoodsListBean.checkout_mode = map['checkout_mode'];
//    specfoodsListBean.recent_popularity = map['recent_popularity'];
//    specfoodsListBean.price = map['price'];
//    specfoodsListBean.promotion_stock = map['promotion_stock'];
//    specfoodsListBean.packing_fee = map['packing_fee'];
//    specfoodsListBean.original_price = map['original_price'];
    return specfoodsListBean;
  }

  static List<SpecfoodsListBean> fromMapList(dynamic mapList) {
    if(mapList == null)return new List();
    List<SpecfoodsListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
