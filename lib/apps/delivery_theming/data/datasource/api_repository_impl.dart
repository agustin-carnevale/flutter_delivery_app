import 'package:test_app/apps/delivery_theming/data/in_memory_products.dart';
import 'package:test_app/apps/delivery_theming/domain/exception/auth_exception.dart';
import 'package:test_app/apps/delivery_theming/domain/model/user.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/api_repository.dart';
import 'package:test_app/apps/delivery_theming/domain/response/login_response.dart';
import 'package:test_app/apps/delivery_theming/domain/request/login_request.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface{
 
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if(token == 'AA111'){
      return User(
        name: 'Steve Jobs',
        username: 'stevejobs',
        image: 'assets/steve-jobs.jpg',
      );
    }else if(token == 'AA222'){
       return User(
        name: 'Elon Musk',
        username: 'elonmusk',
        image: 'assets/elon-musk.jpg',
      );
    }
    throw AuthException();
  }
  
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    await Future.delayed(const Duration(seconds: 3));
    if(loginRequest.username == 'stevejobs' && loginRequest.password == 'jobsy'){
      return LoginResponse(
        'AA111', 
        User(
          name: 'Steve Jobs',
          username: 'stevejobs',
          image: 'assets/steve-jobs.jpg',
        )
      );

    }else  if(loginRequest.username == 'elonmusk' && loginRequest.password == 'musky'){
      return LoginResponse(
        'AA222', 
        User(
          name: 'Elon Musk',
          username: 'elonmusk',
          image: 'assets/elon-musk.jpg',
        )
      );
    }
    throw AuthException();
  }
  
  @override
  Future<void> logout(String token) async{
    print('Removing Token from server: $token');
  }

  @override
  getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }
}