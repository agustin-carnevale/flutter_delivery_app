import 'package:flutter/material.dart';
import 'package:test_app/apps/delivery_theming/presentation/splash/splash_screen.dart';
import 'package:test_app/apps/delivery_theming/presentation/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Apps',
      theme: lightTheme,
      home: SplashScreen()
    );
  }
}
