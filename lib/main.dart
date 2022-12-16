import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job4all/data/repo/app_repo.dart';
import 'package:job4all/routes/router.dart';
import 'package:job4all/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => AppRepo(), fenix: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Job4all',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: GoogleFonts.roboto().fontFamily),
            onGenerateRoute: PageRouter.generateRoutes,
            initialRoute: Routes.SPLASH,
          );
        });
  }
}
