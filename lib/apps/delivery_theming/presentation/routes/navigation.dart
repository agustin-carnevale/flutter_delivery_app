import 'package:get/route_manager.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/home_binding.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/home_screen.dart';
import 'package:test_app/apps/delivery_theming/presentation/login/login.dart';
import 'package:test_app/apps/delivery_theming/presentation/login/login_binding.dart';
import 'package:test_app/apps/delivery_theming/presentation/splash/splash_binding.dart';
import 'package:test_app/apps/delivery_theming/presentation/splash/splash_screen.dart';

import '../main_binding.dart';

class DeliveryRoutes{
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

class DeliveryPages {
  static final pages = [
    GetPage(
      name: DeliveryRoutes.splash,
      page: () => SplashScreen(),
      bindings: [MainBinding(),SplashBinding()],
    ),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => LoginScreen(),
      bindings: [MainBinding(),LoginBinding()],
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: () => HomeScreen(), 
      bindings: [MainBinding(),HomeBinding()],
    ),
  ];
}