import 'package:cuidapet_mobile/app/core/local_storages/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sp = await _instance;
    sp.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final sp = await _instance;
    return sp.containsKey(key);
  }

  @override
  Future<P?> read<P>(String key) async {
    final sp = await _instance;

    if (P == String) {
      return sp.getString(key) as P?;
    } else if (P == int) {
      return sp.getInt(key) as P?;
    } else if (P == bool) {
      return sp.getBool(key) as P?;
    } else if (P == double) {
      return sp.getDouble(key) as P?;
    } else if (P == List) {
      return sp.getStringList(key) as P?;
    } else {
      throw Exception('Type not supported');
    }
  }

  @override
  Future<void> write<P>(String key, P value) async {
    
    final sp = await _instance;

    if (P == String) {
      sp.setString(key, value as String);
    } else if (P == int) {
      sp.setInt(key, value as int);
    } else if (P == bool) {
      sp.setBool(key, value as bool);
    } else if (P == double) {
      sp.setDouble(key, value as double);
    } else if (P == List) {
      sp.setStringList(key, value as List<String>);
    } else {
      throw Exception('Type not supported');
    }
  }

  @override
  Future<void> remove(String key) async {
    final sp = await _instance;
    sp.remove(key);
  }
}
