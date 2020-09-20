import 'package:test_app/apps/delivery_theming/domain/model/user.dart';
import 'package:test_app/apps/delivery_theming/domain/request/login_request.dart';
import 'package:test_app/apps/delivery_theming/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<void> logout(String token);
}