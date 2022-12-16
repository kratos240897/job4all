import 'package:get/get.dart';
import 'package:job4all/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      Get.toNamed(Routes.WELCOME);
    });
    super.onReady();
  }
}
