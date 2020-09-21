import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/apps/delivery_theming/domain/model/product.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/cart/cart_controller.dart';
import 'package:test_app/apps/delivery_theming/presentation/home/products/products_controller.dart';
import 'package:test_app/apps/delivery_theming/presentation/widgets/delivery_button.dart';
import '../../theme.dart';

class ProductsScreen extends StatelessWidget {
  final controller = Get.put<ProductsController>(
    ProductsController(
      apiRepositoryInterface: Get.find(),
    )
  );
  final cartController = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: Obx(()=> controller.productList.isNotEmpty ? GridView.builder(
              padding: const EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                final product = controller.productList[index];
                return _ItemProduct(product: product , onTap: (){
                  cartController.add(product);
                },);
              })
              : 
              const Center(
                child: CircularProgressIndicator()
              )
        ));
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({Key key, this.product, this.onTap}) : super(key: key);
  final Product product;
  final VoidCallback onTap;

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
              onTap: onTap)
        ]),
      ),
    );
  }
}
