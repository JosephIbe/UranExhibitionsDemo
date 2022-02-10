import 'dart:convert';

List<Exhibits> exhibitsFromJson(String str)
          => List<Exhibits>.from(json.decode(str).map((x) => Exhibits.fromJson(x)));

String exhibitsToJson(List<Exhibits> data)
          => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exhibits {
  Exhibits({
    required this.title,
    required this.images,
  });

  String title;
  List<String> images;

  factory Exhibits.fromJson(Map<String, dynamic> json) => Exhibits(
    title: json["title"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "images": List<dynamic>.from(images.map((x) => x)),
  };

}