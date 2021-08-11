import 'package:cuidapet_mobile/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  UserModel? _userLogged;

  @computed
  UserModel? get userLogged => _userLogged;

  bool get isLogged => _userLogged != null && _userLogged?.email != '';

  @action
  Future<void> loadUser() async {
    var userLogged = false;
    await Future.delayed(const Duration(seconds: 1));
    if (userLogged) {
      _userLogged = UserModel(
          email: 'email', registerType: 'registerType', imgAvatar: 'imgAvatar');
    } else {
      _userLogged = UserModel.empty();
    }
  }
}
