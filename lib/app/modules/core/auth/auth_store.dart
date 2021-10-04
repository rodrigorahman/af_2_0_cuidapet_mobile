import 'package:cuidapet_mobile/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {

  @observable
  UserModel? userModel;

  @action
  Future<void> loadUser() async {
    userModel = UserModel.empty();
  }

}