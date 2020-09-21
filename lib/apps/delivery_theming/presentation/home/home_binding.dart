import 'package:get/instance_manager.dart';
import 'cart/cart_controller.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
      localRepositoryInterface: Get.find(),
      apiRepositoryInterface: Get.find(),
    ));

    Get.lazyPut(() => CartController());
  }
}