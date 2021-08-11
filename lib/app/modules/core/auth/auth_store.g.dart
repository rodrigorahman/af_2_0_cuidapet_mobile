// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<UserModel?>? _$userLoggedComputed;

  @override
  UserModel? get userLogged =>
      (_$userLoggedComputed ??= Computed<UserModel?>(() => super.userLogged,
              name: '_AuthStoreBase.userLogged'))
          .value;

  final _$_userLoggedAtom = Atom(name: '_AuthStoreBase._userLogged');

  @override
  UserModel? get _userLogged {
    _$_userLoggedAtom.reportRead();
    return super._userLogged;
  }

  @override
  set _userLogged(UserModel? value) {
    _$_userLoggedAtom.reportWrite(value, super._userLogged, () {
      super._userLogged = value;
    });
  }

  final _$loadUserAsyncAction = AsyncAction('_AuthStoreBase.loadUser');

  @override
  Future<void> loadUser() {
    return _$loadUserAsyncAction.run(() => super.loadUser());
  }

  @override
  String toString() {
    return '''
userLogged: ${userLogged}
    ''';
  }
}
