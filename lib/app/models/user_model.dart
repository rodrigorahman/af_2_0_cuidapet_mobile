class UserModel {
  final String email;
  final String registerType;
  final String imgAvatar;

  UserModel({
    required this.email,
    required this.registerType,
    required this.imgAvatar,
  });

  UserModel.empty()
      : email = '',
        registerType = '',
        imgAvatar = '';
}
