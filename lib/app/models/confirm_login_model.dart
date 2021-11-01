import 'dart:convert';

class ConfirmLoginModel {
  final String accessToken;
  final String refreshToken;

  ConfirmLoginModel({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  factory ConfirmLoginModel.fromMap(Map<String, dynamic> map) {
    return ConfirmLoginModel(
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirmLoginModel.fromJson(String source) =>
      ConfirmLoginModel.fromMap(json.decode(source));
}
