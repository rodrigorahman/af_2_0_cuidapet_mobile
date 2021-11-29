class SocialNetworkModel {
  String id;
  String name;
  String email;
  String type;
  String accessToken;
  String? avatar;
  SocialNetworkModel({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.accessToken,
    this.avatar,
  });
}
