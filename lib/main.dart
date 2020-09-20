import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/apps/delivery_theming/presentation/main_binding.dart';
import 'package:test_app/apps/delivery_theming/presentation/routes/navigation.dart';
import 'package:test_app/apps/delivery_theming/presentation/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Apps',
      theme: darkTheme,
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPages.pages,
      initialBinding: MainBinding(),
    );
  }
}
