import 'package:get/instance_manager.dart';
import 'package:test_app/apps/delivery_theming/presentation/splash/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(
      localRepositoryInterface: Get.find(),
      apiRepositoryInterface: Get.find(),
    ));
  }
}