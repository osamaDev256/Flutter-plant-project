import 'dart:convert';

class Users {
  // int? id;
  String? name;
  String? email;
  String? passWo;

  Users({this.email, this.name, this.passWo});
  Users.fromJson(Map json) {
    name = json["user_name"];
    email = json["email"];
    passWo = json["password"];
  }

  Map<String, dynamic> toJson() {
    return {
      "user_name": name,
      "email": email,
      "password": passWo,
    };
  }
}
