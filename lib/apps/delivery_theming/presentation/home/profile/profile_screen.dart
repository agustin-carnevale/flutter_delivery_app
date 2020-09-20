import 'package:flutter/material.dart';
import 'package:test_app/apps/delivery_theming/data/datasource/api_repository_impl.dart';
import 'package:test_app/apps/delivery_theming/data/datasource/local_repository_impl.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/api_repository.dart';
import '../../theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                    child: CircleAvatar(radius: 50),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Username",
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
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: DeliveryColors.green,
                                ),
                              ),
                              Text(
                                'email@email.com',
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
                                Switch(
                                  value: true,
                                  onChanged: (bool value) {},
                                )
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
                    onPressed: () {
                      LocalRepositoryImpl().clearAllData();
                    },
                  ))
                ],
              ))
        ]));
  }
}
