import 'user_model.dart';

class AuthResponseModel {
  final String token;
  final UserModel user;
  final String? refreshToken;

  AuthResponseModel({
    required this.token,
    required this.user,
    this.refreshToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['access_token'] ?? json['token'],
      user: UserModel.fromJson(json['user'] ?? json['data']),
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': token,
      'user': user.toJson(),
      if (refreshToken != null) 'refresh_token': refreshToken,
    };
  }
}