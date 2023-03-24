import 'package:u_neptun/model/university.dart';

class User {
  University university;
  String neptunCode;
  String password;

  User({required this.university, required this.neptunCode, required this.password});

  User.fromJson(Map<String, dynamic> json)
    : university = University.fromJson(json["university"]),
      neptunCode = json["neptunCode"],
      password = json["password"];

  Map<String, dynamic> toJson() => {
    "university": university.toJson(),
    "neptunCode": neptunCode,
    "password": password
  };

}