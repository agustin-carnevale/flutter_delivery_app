import 'package:flutter/material.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/cart/cart_screen.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/products/products_screen.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/profile/profile_screen.dart';
import 'package:test_app/apps/delivery_theming/presentation/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(
              child: IndexedStack(
            index: currentIndex,
            children: [
              ProductsScreen(),
              Text('currentIndex2 $currentIndex'),
              CartScreen(
                onShopping: (){
                  setState(() {
                    currentIndex =0;
                  });
                },
              ),
              Text('currentIndex4 $currentIndex'),
              ProfileScreen(),
            ],
        )),
        _DeliveryNavigationBar(
          index: currentIndex,
          onIndexSelected: (index) {
            setState(() {
               currentIndex = index;
            });
          }),
    ]));
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  const _DeliveryNavigationBar({Key key, this.index, this.onIndexSelected})
      : super(key: key);
  final int index;
  final ValueChanged<int> onIndexSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border.all(
              width: 2,
              color: Theme.of(context).bottomAppBarColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    child: IconButton(
                      icon: Icon(
                        Icons.home,
                        color: index == 0 ? DeliveryColors.green : DeliveryColors.lightGrey,
                      ),
                      onPressed: () => onIndexSelected(0),
                    ),
                  ),
                  Material(
                    child: IconButton(
                      icon: Icon(Icons.store,
                        color: index == 1 ? DeliveryColors.green : DeliveryColors.lightGrey,),
                      onPressed: () => onIndexSelected(1),
                    ),
                  ),
                  Material(
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: DeliveryColors.purple,
                      child: IconButton(
                        icon: Icon(Icons.shopping_basket,  color: index == 2 ? DeliveryColors.green : DeliveryColors.white,),
                        onPressed: () => onIndexSelected(2),
                      ),
                    ),
                  ),
                  Material(
                    child: IconButton(
                      icon: Icon(Icons.favorite_border,  color: index == 3 ? DeliveryColors.green :  DeliveryColors.lightGrey,),
                      onPressed: () => onIndexSelected(3),
                    ),
                  ),
                  InkWell(
                    onTap: () => onIndexSelected(4),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
