import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:job4all/modules/splash/splash_binding.dart';
import 'package:job4all/modules/welcome/welcome.dart';
import 'package:job4all/modules/welcome/welcome_binding.dart';
import 'package:job4all/routes/routes.dart';

import '../modules/home/home.dart';
import '../modules/home/home_binding.dart';
import '../modules/splash/splash.dart';

class PageRouter {
  static Route? generateRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.SPLASH:
        return GetPageRoute(
            routeName: Routes.SPLASH,
            page: () => const Splash(),
            binding: SplashBinding());
      case Routes.WELCOME:
        return GetPageRoute(
            routeName: Routes.WELCOME,
            page: () => const Welcome(),
            binding: WelcomeBinding());
      case Routes.HOME:
        return GetPageRoute(
            routeName: Routes.HOME,
            page: () => Home(role: args as String),
            binding: HomeBinding());
    }
    return null;
  }
}
