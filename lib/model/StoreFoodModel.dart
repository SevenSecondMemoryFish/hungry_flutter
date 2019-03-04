
class StoreSectionFoodModel {
  String rated_at;
  String rating_text;
  String time_spent_desc;
  String _id;
  String username;
  String avatar;
  int rating_star;
  List<StoreFoodModel> foodItems = new List();

  static StoreSectionFoodModel fromMap(Map<String, dynamic> map) {
    StoreSectionFoodModel temp = new StoreSectionFoodModel();
    temp.rated_at = map['rated_at'];
    temp.rating_text = map['rating_text'];
    temp.time_spent_desc = map['time_spent_desc'];
    temp._id = map['_id'];
    temp.username = map['username'];
    temp.avatar = map['avatar'];
    temp.rating_star = map['rating_star'];
    temp.foodItems = StoreFoodModel.fromMapList(map['item_ratings']);
    return temp;
  }

  static List<StoreSectionFoodModel> fromMapList(dynamic mapList) {
    if(mapList == null)return new List();
    List<StoreSectionFoodModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class StoreFoodModel {
  String food_name;
  String _id;
  String image_hash;
  int food_id;
  int is_valid;

  static StoreFoodModel fromMap(Map<String, dynamic> map) {
    StoreFoodModel item_ratingsListBean = new StoreFoodModel();
    item_ratingsListBean.food_name = map['food_name'];
    item_ratingsListBean._id = map['_id'];
    item_ratingsListBean.image_hash = map['image_hash'];
    item_ratingsListBean.food_id = map['food_id'];
    item_ratingsListBean.is_valid = map['is_valid'];
    return item_ratingsListBean;
  }

  static List<StoreFoodModel> fromMapList(dynamic mapList) {
    if(mapList == null)return new List();
    List<StoreFoodModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
