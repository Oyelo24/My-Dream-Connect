import 'user_model.dart';

class AuthResponseModel {
  final String token;
  final UserModel record;

  AuthResponseModel({
    required this.token,
    required this.record,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'],
      record: UserModel.fromJson(json['record']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'record': record.toJson(),
    };
  }
}