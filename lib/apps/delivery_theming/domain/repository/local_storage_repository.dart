import 'package:test_app/apps/delivery_theming/domain/model/user.dart';

abstract class LocalRepositoryInterface{
  Future<String> getToken();
  Future<void> saveToken(String token);
  Future<void> clearAllData();
  Future<void> saveUser(User user);
  Future<User> getUser();
  Future<void> saveDarkMode(bool isDarkMode);
  Future<bool> isDarkMode();
}