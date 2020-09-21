import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/cart/cart_controller.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/cart/cart_screen.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/home_controller.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/products/products_screen.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/profile/profile_screen.dart';
import 'package:test_app/apps/delivery_theming/presentation/theme.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(
          child: Obx(()=> IndexedStack(
            index: controller.indexSelected.value,
            children: [
                ProductsScreen(),
                const Placeholder(),
                CartScreen(
                  onShopping: (){
                    controller.updateIndexSelected(0);
                  },
                ),
                const Placeholder(),
                ProfileScreen(),
            ],
        ),
        )),
        Obx(()=> _DeliveryNavigationBar(
            index: controller.indexSelected.value,
            onIndexSelected: (index) {
              controller.updateIndexSelected(index);
            }),
        ),
    ]));
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  _DeliveryNavigationBar({Key key, this.index, this.onIndexSelected})
      : super(key: key);
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

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
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundColor: DeliveryColors.purple,
                          child: IconButton(
                            icon: Icon(Icons.shopping_basket,  color: index == 2 ? DeliveryColors.green : DeliveryColors.white,),
                            onPressed: () => onIndexSelected(2),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Obx(()=>  cartController.totalItems.value == 0 
                          ? const SizedBox.shrink()
                          : CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.pinkAccent,
                          child: Text(cartController.totalItems.value.toString())),
                        ),
                        )
                      ],
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
                    child: Obx((){
                      final user = controller?.user?.value;
                      return user.image == null ? SizedBox.shrink() :
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(user.image),
                      );
                    }),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
