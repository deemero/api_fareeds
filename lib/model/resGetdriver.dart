// To parse this JSON data, do
//
//     final resGetDriver = resGetDriverFromJson(jsonString);

import 'dart:convert';

ResGetDriver resGetDriverFromJson(String str) =>
    ResGetDriver.fromJson(json.decode(str));

String resGetDriverToJson(ResGetDriver data) => json.encode(data.toJson());

class ResGetDriver {
  static var length;

  ResGetDriver({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum>? data;

  factory ResGetDriver.fromJson(Map<String, dynamic> json) => ResGetDriver(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.company,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.status,
    required this.username,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String company;
  String name;
  String gender;
  DateTime? birthDate;
  String status;
  String username;
  String password;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        company: json["company"] == null ? null : json["company"],
        name: json["name"] == null ? null : json["name"],
        gender: json["gender"] == null ? null : json["gender"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        status: json["status"] == null ? null : json["status"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "company": company == null ? null : company,
        "name": name == null ? null : name,
        "gender": gender == null ? null : gender,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "status": status == null ? null : status,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
