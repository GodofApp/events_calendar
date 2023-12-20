// To parse this JSON data, do
//
//     final calendarModel = calendarModelFromJson(jsonString);

import 'dart:convert';

List<CalendarModel> calendarModelFromJson(String str) => List<CalendarModel>.from(json.decode(str).map((x) => CalendarModel.fromJson(x)));

String calendarModelToJson(List<CalendarModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalendarModel {
  String? date;
  List<Datum>? data;

  CalendarModel({
    this.date,
    this.data,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
    date: json["date"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? name;
  int? type;
  String? contactNo;
  int? prority;
  String? dueDate;
  int? level;
  int? daysLeft;

  Datum({
    this.id,
    this.name,
    this.type,
    this.contactNo,
    this.prority,
    this.dueDate,
    this.level,
    this.daysLeft,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    contactNo: json["contact_no"],
    prority: json["prority"],
    dueDate: json["due_date"],
    level: json["level"],
    daysLeft: json["days_left"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "contact_no": contactNo,
    "prority": prority,
    "due_date": dueDate,
    "level": level,
    "days_left": daysLeft,
  };
}
