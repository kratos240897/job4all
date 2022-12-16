import 'package:get/instance_manager.dart';
import 'package:job4all/modules/welcome/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController(), fenix: true);
  }
}
