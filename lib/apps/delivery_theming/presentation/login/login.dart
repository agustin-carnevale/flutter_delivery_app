import 'package:flutter/material.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/home_screen.dart';
import 'package:test_app/apps/delivery_theming/presentation/theme.dart';
import 'package:test_app/apps/delivery_theming/presentation/widgets/delivery_button.dart';

const logoSize = 45.0;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          flex: 2,
          child: Stack(children: [
            Positioned.fill(
                bottom: logoSize,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.3, 1.0],
                          colors: deliveryGradient),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(size.width / 2))),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                radius: logoSize,
                child: ClipOval(child: Image.asset('assets/logo.jpg')),
              ),
            )
          ])),
      Expanded(
          flex: 4,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Username',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .labelStyle
                              .color,
                        ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: 'username'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Password',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .labelStyle
                              .color,
                        ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: 'password'),
                  ),
                ]),
          ))),
      Padding(
        padding: const EdgeInsets.all(25),
        child: DeliveryButton(
          text: 'Login',
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) {
              return HomeScreen();
            }));
          },
        )
      )
    ]));
  }
}
