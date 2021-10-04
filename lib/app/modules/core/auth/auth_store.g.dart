// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$userModelAtom = Atom(name: '_AuthStoreBase.userModel');

  @override
  UserModel? get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel? value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
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
userModel: ${userModel}
    ''';
  }
}
