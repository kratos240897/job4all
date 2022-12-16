import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:job4all/modules/splash/splash_controller.dart';
import 'package:job4all/styles/app_colors.dart';

class Splash extends GetView<SplashController> {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/logo.png',
                height: 0.3.sh,
                width: 0.3.sh,
              ),
              30.verticalSpace,
              Text(
                  'Building a community to get work done!\nNo Job or Skill is too small!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.white))
            ]),
      ),
    );
  }
}
