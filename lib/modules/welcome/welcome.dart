import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:job4all/constants/app_constants.dart';
import 'package:job4all/extensions/dimen_extension.dart';
import 'package:job4all/modules/welcome/welcome_controller.dart';
import 'package:job4all/styles/app_colors.dart';

class Welcome extends GetView<WelcomeController> {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            0.1.sh.verticalSpace,
            Text(
                'Building a community to get work done!\nNo Job or Skill is too small!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            50.verticalSpace,
            Image.asset(
              'lib/assets/logo.png',
              height: 0.3.sh,
              width: 0.3.sh,
            ),
            30.verticalSpace,
            CustomButton(
              backgroundColor: Colors.white,
              text: 'Poster',
              textColor: AppColors.primaryColor,
              onTap: () => controller.navigateToHome(AppConstants.POSTER),
            ),
            15.verticalSpace,
            CustomButton(
              backgroundColor: AppColors.primaryColorDark,
              text: 'Bidder',
              textColor: Colors.white,
              onTap: () => controller.navigateToHome(AppConstants.BIDDER),
            ),
          ],
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
            fixedSize: Size(0.6.sw, 0.055.sh),
            shape: const StadiumBorder()),
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: textColor, fontWeight: FontWeight.bold),
        ));
  }
}
