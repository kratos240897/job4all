import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 224.0),
            Image.asset(
              'lib/assets/logo.png',
              height: 322.0,
              width: 322.0,
            ),
            const SizedBox(height: 134.0),
            Text(
                'Building a community to get work done!\nNo Job or Skill is too small!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 20.0,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))
          ]),
        ),
      ),
    );
  }
}
