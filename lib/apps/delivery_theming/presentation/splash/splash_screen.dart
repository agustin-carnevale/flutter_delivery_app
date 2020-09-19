import 'package:flutter/material.dart';
import 'package:test_app/apps/delivery_theming/presentation/login/login.dart';
import 'package:test_app/apps/delivery_theming/presentation/theme.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_)=> LoginScreen(),
        )
      );
    });
    super.initState();
  }
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