import '../repositories/shared_preferences_repository.dart';

class AuthService {
  final SharedPreferencesRepository storage;

  AuthService(this.storage);

  Future<void> register(String email, String password) async {
    await storage.saveUserData(email, password);
  }

  Future<bool> login(String email, String password) async {
    final userData = await storage.getUserData();
    final isLoggedIn =
        userData['email'] == email && userData['password'] == password;
    if (isLoggedIn) {
      await storage.saveLoggedInStatus(true);
    }
    return isLoggedIn;
  }

  Future<void> logout() async {
    await storage.clearUserData();
    await storage.saveLoggedInStatus(false);
  }

  Future<bool> checkIfLoggedIn() async {
    return await storage.getLoggedInStatus();
  }
}
