
import 'dart:convert';

List<TypeModel> typeModelFromJson(String str) => List<TypeModel>.from(json.decode(str).map((x) => TypeModel.fromJson(x)));

String typeModelToJson(List<TypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeModel {
  String? type;
  String? name;
  int? count;

  TypeModel({
    this.type,
    this.count,
    this.name
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
    type: json["type"],
    count: json["count"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "count": count,
    "name": name,
  };
}