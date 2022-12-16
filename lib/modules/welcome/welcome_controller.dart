import 'package:get/get.dart';
import '../../routes/routes.dart';

class WelcomeController extends GetxController {
  void navigateToHome(String role) {
    Get.toNamed(Routes.HOME, arguments: role);
  }
}
