import 'package:get/get.dart';
import 'package:test_app/apps/delivery_theming/domain/model/product.dart';
import 'package:test_app/apps/delivery_theming/domain/model/product_cart.dart';

class CartController extends GetxController{
  RxList<ProductCart> cartList = <ProductCart>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void add(Product product){
   final temp = List<ProductCart>.from(cartList.value);
   bool found = false;
   for (ProductCart p in temp){
     if(p.product.name == product.name){
       p.quantity +=1;
       found = true;
       break;
     }
   }
   if(!found){
     temp.add(ProductCart(product: product));
   }
   cartList.value = List<ProductCart>.from(temp);
   calculateTotals(temp);
  }

  void increment(ProductCart productCart){
   productCart.quantity +=1;
   cartList.value = List<ProductCart>.from(cartList.value);
   calculateTotals(cartList.value);

  }

  void decrement(ProductCart productCart){
    if(productCart.quantity > 1){
      productCart.quantity -=1;
      cartList.value = List<ProductCart>.from(cartList.value);
      calculateTotals(cartList.value);
    }
  }

  calculateTotals(List<ProductCart> temp){
    final total = temp.fold(0, (previousValue, element) => element.quantity+previousValue);
    totalItems(total);
    final totalCost = temp.fold(0.0, (previousValue, element) => (element.quantity * element.product.price)+previousValue);
    totalPrice(totalCost);
  }


  void delete(ProductCart productCart){
    cartList.remove(productCart);
    calculateTotals(cartList.value);
  }
}