abstract class UserService {
  Future<void> register(String email, String password);
  Future<void> login(String login, String password);
}