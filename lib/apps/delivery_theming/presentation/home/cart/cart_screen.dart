import 'package:flutter/material.dart';
import 'package:test_app/apps/delivery_theming/data/in_memory_products.dart';
import 'package:test_app/apps/delivery_theming/domain/model/product.dart';
import 'package:test_app/apps/delivery_theming/presentation/theme.dart';
import 'package:test_app/apps/delivery_theming/presentation/widgets/delivery_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key, this.onShopping}) : super(key: key);
  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: _FullCart()
        // _EmptyCart(onShopping: onShopping,)
        );
  }
}

class _FullCart extends StatelessWidget {
  const _FullCart({
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
              child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemExtent: 230,
                  itemBuilder: (context, index) {
                    return _ShoppingCartProduct(product: products[index]);
                  }),
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
                            style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context).accentColor
                            )
                          ),
                          Text('0.0 usd',
                            style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context).accentColor
                            )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery',
                            style: TextStyle(
                              color: Theme.of(context).accentColor)
                          ),
                          Text('Free',
                            style: TextStyle(
                              color: Theme.of(context).accentColor)
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).accentColor)
                          ),
                          Text('\$85.00 USD',
                            style: TextStyle(
                               fontSize: 18,
                              color: Theme.of(context).accentColor)
                          ),
                        ],
                      ),
                      Spacer(),
                      DeliveryButton(
                        text: 'Checkout',
                        onTap:(){

                        }
                      )
                    ]
                  ),
                  ),
                )
              )
            ),
      ],
    );
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  const _ShoppingCartProduct({Key key, this.product}) : super(key: key);
  final Product product;

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
                            product.image,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      flex: 3,
                      child: Column(children: [
                        Text(
                          product.name,
                          style: TextStyle(color: DeliveryColors.green),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          product.description,
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
                                onTap: () {
                                  print('remove');
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('2'),
                              ),
                              InkWell(
                                onTap: () {
                                  print('add');
                                },
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
                                '\$${product.price}',
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
                onTap: () {},
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
