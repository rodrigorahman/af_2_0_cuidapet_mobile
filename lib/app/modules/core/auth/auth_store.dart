import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_storage.dart';
import 'package:cuidapet_mobile/app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final LocalStorage _localStorage;

  @observable
  UserModel? userModel;

  _AuthStoreBase({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @action
  Future<void> loadUser() async {
    final userLoggedData =
        await _localStorage.read<String>(Constants.USER_DATA_KEY);

    if (userLoggedData != null) {
      userModel = UserModel.fromJson(userLoggedData);
    } else {
      userModel = UserModel.empty();
    }

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        userModel = UserModel.empty();
      }
    });
  }

  Future<void> logout() async {
    await _localStorage.clear();
    userModel = null;
  }

}
