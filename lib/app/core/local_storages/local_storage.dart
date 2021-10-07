abstract class LocalStorage {
  Future<P?> read<P>(String key);
  Future<void> write<P>(String key, P value);
  Future<bool> contains(String key);
  Future<void> clear();
  Future<void> remove(String key);
}