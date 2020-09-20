import 'package:test_app/apps/delivery_theming/domain/model/user.dart';

class LoginResponse{
  LoginResponse(this.token, this.user);
  final String token;
  final User user;
}