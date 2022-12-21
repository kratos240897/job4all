import 'package:flutter/material.dart';
import 'package:job4all/data/repo/app_repo.dart';
import 'package:job4all/helpers/screen_utils.dart';
import 'package:job4all/routes/router.dart';
import 'package:job4all/routes/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtils().init(minTextAdapt: true);
  Get.lazyPut(() => AppRepo(), fenix: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job4all',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto'),
      onGenerateRoute: PageRouter.generateRoutes,
      initialRoute: Routes.SPLASH,
    );
  }
}
