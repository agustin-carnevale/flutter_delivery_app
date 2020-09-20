import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_app/apps/delivery_theming/presentation/splash/splash_controller.dart';
import 'package:test_app/apps/delivery_theming/presentation/theme.dart';

class SplashScreen extends GetWidget<SplashController> {
  final splashController = Get.find<SplashController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradient,
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: ClipOval(child: Image.asset('assets/logo.jpg')),
            ),
            const SizedBox(height: 10),
            Text(
              "Delivery App", 
              style: Theme.of(context).textTheme.headline5.copyWith(
                fontWeight: FontWeight.w700,
                color: DeliveryColors.white
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}