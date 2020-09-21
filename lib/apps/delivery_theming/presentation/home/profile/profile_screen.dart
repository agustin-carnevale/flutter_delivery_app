import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/apps/delivery_theming/presentation/routes/navigation.dart';
import '../../theme.dart';
import '../home_controller.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();

  Future<void> logout(){
    controller.logout();
    Get.offAllNamed(DeliveryRoutes.splash);
  }

  void onThemeUpdated(bool isDark){
    controller.updateTheme(isDark);
    Get.changeTheme(isDark ? darkTheme : lightTheme);
  }

  @override
  Widget build(BuildContext context) {
    final user = controller.user.value;
    return Obx(
        () => Scaffold(
          appBar: AppBar(title: Text('Profile')),
          body: user.image != null ? Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: DeliveryColors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(user.image),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                   user.name,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Card(
                        color: Theme.of(context).canvasColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Personal Information',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 15),
                                Text(
                                  'Username',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: DeliveryColors.green,
                                  ),
                                ),
                                Text(
                                  user.username,
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(children: [
                                  Text(
                                    'Dark Mode',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Obx(()=> Switch(
                                    value: controller.darkTheme.value,
                                    onChanged: onThemeUpdated,
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                        child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: DeliveryColors.purple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Log Out",
                          style: TextStyle(color: DeliveryColors.white),
                        ),
                      ),
                      onPressed: logout,
                    ))
                  ],
                ))
          ]):
          SizedBox.shrink()
        ),
    );
  }
}
