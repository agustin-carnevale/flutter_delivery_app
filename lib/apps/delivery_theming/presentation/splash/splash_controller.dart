import 'package:get/state_manager.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/api_repository.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/local_storage_repository.dart';
import 'package:test_app/apps/delivery_theming/presentation/routes/navigation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  SplashController({this.localRepositoryInterface, this.apiRepositoryInterface});
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
 
  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async{
    final token = await localRepositoryInterface.getToken();
    if(token != null){
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
    }else{
      Get.offNamed(DeliveryRoutes.login);
    }
  }
}