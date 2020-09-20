import 'package:get/instance_manager.dart';
import 'package:test_app/apps/delivery_theming/data/datasource/api_repository_impl.dart';
import 'package:test_app/apps/delivery_theming/data/datasource/local_repository_impl.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/api_repository.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/local_storage_repository.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
   Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}