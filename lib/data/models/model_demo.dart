/// title : "iPhone 5s"
/// images : ["https://upload.wikimedia.org/wikipedia/commons/f/fd/IPhone_5S.jpg","http://img01.ibnlive.in/ibnlive/uploads/2015/12/apple-iphone5s-151215.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5cv-olMz3XKQNhQP4SpwiwqtiDreaBlpESHdCDc6Jm5GjHzRsHcxXrqAI"]

class ModelDemo {
  ModelDemo({
      this.title, 
      this.images,});

  ModelDemo.fromJson(dynamic json) {
    title = json['title'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  String? title;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['images'] = images;
    return map;
  }

}