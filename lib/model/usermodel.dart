// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

Map<String, User> userFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, User>(k, User.fromJson(v)));

class User {
  User({
    this.address,
    this.contactNumber,
    this.fullName,
    this.userId,
  });

  String address;
  String contactNumber;
  String fullName;
  String userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        address: json["Address"],
        contactNumber: json["ContactNumber"],
        fullName: json["FullName"],
        userId: json["UserID"] == null ? null : json["UserID"],
      );
}
