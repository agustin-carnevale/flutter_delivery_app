import 'package:get/state_manager.dart';
import 'package:test_app/apps/delivery_theming/domain/model/user.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/api_repository.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/local_storage_repository.dart';

class HomeController extends GetxController{
  HomeController({this.apiRepositoryInterface, this.localRepositoryInterface});
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  Rx<User> user = User.empty().obs;
  RxInt indexSelected = 0.obs;
  RxBool darkTheme = false.obs;

  @override
  void onReady() {
    loadUser();
    loadCurrentTheme();
    super.onReady();
  }

  void loadUser(){
    localRepositoryInterface.getUser().then((value){
      user(value);
    });
  }

  void loadCurrentTheme(){
    localRepositoryInterface.isDarkMode().then((value){
      darkTheme(value);
    });
  }

  bool updateTheme(bool isDark){
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }

  void updateIndexSelected(int index){
    indexSelected(index);
  }

  void logout() async{
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }
}