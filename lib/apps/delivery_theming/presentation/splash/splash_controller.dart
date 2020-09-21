import 'package:get/state_manager.dart';
import 'package:test_app/apps/delivery_theming/data/datasource/api_repository_impl.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/api_repository.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/local_storage_repository.dart';
import 'package:test_app/apps/delivery_theming/presentation/routes/navigation.dart';
import 'package:get/get.dart';

import '../theme.dart';

class SplashController extends GetxController{
  SplashController({this.localRepositoryInterface, this.apiRepositoryInterface});
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  @override
  void onInit() {
    validateTheme();
    super.onInit();
  }
 
  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateTheme() async{
    final isDark = await localRepositoryInterface.isDarkMode();
    if(isDark != null){
     Get.changeTheme(isDark ? darkTheme : lightTheme);
    }else{
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
    }
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