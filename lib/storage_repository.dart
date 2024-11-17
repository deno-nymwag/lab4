abstract class StorageRepository {
  Future<void> saveData(String key, String value);
  Future<String?> loadData(String key);
  Future<void> removeData(String key);

  Future<void> saveUserData(String userData);
  Future<String?> getUserData();
  Future<void> setLoggedIn(bool isLoggedIn);
  Future<bool> isLoggedIn();
  Future<void> clearUserData();
}
