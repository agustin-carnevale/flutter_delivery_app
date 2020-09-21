import 'package:get/get.dart';
import 'package:test_app/apps/delivery_theming/domain/model/product.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/api_repository.dart';

class ProductsController extends GetxController{
  ProductsController({this.apiRepositoryInterface});
  final ApiRepositoryInterface apiRepositoryInterface;

  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async{
    final result = await apiRepositoryInterface.getProducts();
    productList.value = result;
  }

}