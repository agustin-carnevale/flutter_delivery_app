import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_app/apps/delivery_theming/domain/model/product_cart.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/cart/cart_controller.dart';
import 'package:test_app/apps/delivery_theming/presentation/theme.dart';
import 'package:test_app/apps/delivery_theming/presentation/widgets/delivery_button.dart';

class CartScreen extends GetWidget<CartController> {
  CartScreen({Key key, this.onShopping}) : super(key: key);
  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: Obx(() => controller.totalItems.value == 0
            ? _EmptyCart(
                onShopping: onShopping,
              )
            : _FullCart()));
  }
}

class _FullCart extends GetWidget<CartController> {
  _FullCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.cartList.length,
                    scrollDirection: Axis.horizontal,
                    itemExtent: 230,
                    itemBuilder: (context, index) {
                      final productCart = controller.cartList[index];
                      return _ShoppingCartProduct(
                        productCart: productCart,
                        onDelete: () {
                          controller.delete(productCart);
                        },
                        onIncrement: () {
                          controller.increment(productCart);
                        },
                        onDecrement: () {
                          controller.decrement(productCart);
                        },
                      );
                    }),
              ),
            )),
        Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Theme.of(context).canvasColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sub total',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                          color:
                                              Theme.of(context).accentColor)),
                              Obx(
                                () => Text(
                                    '${controller.totalPrice.toStringAsFixed(2)} usd',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                            color:
                                                Theme.of(context).accentColor)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor)),
                              Text('Free',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).accentColor)),
                              Obx(
                                () => Text(
                                    '${controller.totalPrice.toStringAsFixed(2)} USD',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context).accentColor)),
                              ),
                            ],
                          ),
                          Spacer(),
                          DeliveryButton(text: 'Checkout', onTap: () {})
                        ]),
                  ),
                ))),
      ],
    );
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  const _ShoppingCartProduct(
      {Key key,
      this.productCart,
      this.onDelete,
      this.onIncrement,
      this.onDecrement})
      : super(key: key);
  final ProductCart productCart;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image.asset(
                            productCart.product.image,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      flex: 3,
                      child: Column(children: [
                        Text(
                          productCart.product.name,
                          style: TextStyle(color: DeliveryColors.green),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          productCart.product.description,
                          style: Theme.of(context)
                              .textTheme
                              .overline
                              .copyWith(color: DeliveryColors.lightGrey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: DeliveryColors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Icon(Icons.remove,
                                      color: DeliveryColors.purple),
                                ),
                                onTap: onDecrement,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(productCart.quantity.toString()),
                              ),
                              InkWell(
                                onTap: onIncrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: DeliveryColors.purple,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Icon(
                                    Icons.add,
                                    color: DeliveryColors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$${productCart.product.price}',
                                style: TextStyle(
                                  color: DeliveryColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ]),
            ),
          ),
          Positioned(
              right: 0,
              child: InkWell(
                onTap: onDelete,
                child: CircleAvatar(
                    backgroundColor: DeliveryColors.pink,
                    child: Icon(Icons.delete_outline)),
              ))
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart({
    Key key,
    this.onShopping,
  }) : super(key: key);
  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/sad_emoji.png',
          height: 90,
        ),
        const SizedBox(height: 20),
        Text(
          "There are no products",
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        const SizedBox(height: 20),
        Center(
            child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: DeliveryColors.purple,
          child: Text(
            "Go shopping",
            style: TextStyle(color: DeliveryColors.white),
          ),
          onPressed: onShopping,
        ))
      ],
    );
  }
}
