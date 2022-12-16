import 'package:get/instance_manager.dart';
import 'package:job4all/modules/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
  }
}
