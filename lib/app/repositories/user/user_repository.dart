import 'package:cuidapet_mobile/app/models/confirm_login_model.dart';

abstract class UserRepository {
  Future<void> register(String email, String password);
  Future<String> login(String login, String password);
  Future<ConfirmLoginModel> confirmLogin();
}
