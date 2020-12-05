// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.data,
  });

  Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };

  String get name => data.firstName;
}

class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.socialType,
    this.socialId,
    this.type,
    this.hasPassword,
    this.activationStatus,
    this.accessToken,
    this.image,
    this.subscription,
    this.countNotification,
  });

  String id;
  String firstName;
  String lastName;
  String phone;
  String email;
  dynamic socialType;
  dynamic socialId;
  int type;
  bool hasPassword;
  int activationStatus;
  String accessToken;
  dynamic image;
  int subscription;
  int countNotification;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    email: json["email"],
    socialType: json["social_type"],
    socialId: json["social_id"],
    type: json["type"],
    hasPassword: json["has_password"],
    activationStatus: json["activation_status"],
    accessToken: json["access_token"],
    image: json["image"],
    subscription: json["subscription"],
    countNotification: json["count_notification"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "social_type": socialType,
    "social_id": socialId,
    "type": type,
    "has_password": hasPassword,
    "activation_status": activationStatus,
    "access_token": accessToken,
    "image": image,
    "subscription": subscription,
    "count_notification": countNotification,
  };
}
