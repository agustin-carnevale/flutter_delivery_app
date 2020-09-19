import 'package:flutter/material.dart';
import 'package:test_app/apps/delivery_theming/data/in_memory_products.dart';
import 'package:test_app/apps/delivery_theming/domain/model/product.dart';
import 'package:test_app/apps/delivery_theming/presentation/widgets/delivery_button.dart';

import '../../theme.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _ItemProduct(product: products[index]);
            }));
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({Key key, this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  product.image,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(children: [
              Text(product.name),
              const SizedBox(height: 10),
              Text(
                product.description,
                style: Theme.of(context)
                    .textTheme
                    .overline
                    .copyWith(color: DeliveryColors.lightGrey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text('\$${product.price}USD',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              ),
            ]),
          ),
          DeliveryButton(
              padding: const EdgeInsets.symmetric(vertical: 4),
              text: 'Add',
              onTap: () {})
        ]),
      ),
    );
  }
}
