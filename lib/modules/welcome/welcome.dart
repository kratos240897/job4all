import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:job4all/constants/app_constants.dart';
import 'package:job4all/modules/welcome/welcome_controller.dart';
import 'package:job4all/styles/app_colors.dart';

class Welcome extends GetView<WelcomeController> {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 67.0),
              Text(
                  'Building a community to get work done!\nNo Job or Skill is too small!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      height: 1.5,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              const SizedBox(height: 112.0),
              Image.asset(
                'lib/assets/logo.png',
                height: 322.0,
                width: 322.0,
              ),
              const SizedBox(height: 62.0),
              CustomButton(
                backgroundColor: Colors.white,
                text: 'Poster',
                textColor: AppColors.primaryColor,
                onTap: () => controller.navigateToHome(AppConstants.POSTER),
              ),
              const SizedBox(height: 23.0),
              CustomButton(
                backgroundColor: AppColors.primaryColorDark,
                text: 'Bidder',
                textColor: Colors.white,
                onTap: () => controller.navigateToHome(AppConstants.BIDDER),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final GestureTapCallback onTap;
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.backgroundColor,
      required this.textColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            fixedSize: const Size(350.0, 70.0),
            shape: const StadiumBorder()),
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6?.copyWith(
              fontSize: 25.0, color: textColor, fontWeight: FontWeight.bold),
        ));
  }
}
