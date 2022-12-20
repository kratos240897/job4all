import 'dart:math';

import 'package:flutter/material.dart';

class ScreenUtils {
  ScreenUtils._();
  static final ScreenUtils _instance = ScreenUtils._();
  factory ScreenUtils() {
    return _instance;
  }

  final Size _uiSize = const Size(360, 690);
  static late double screenHeight;
  static late double screenWidth;
  static late double scaleWidth;
  static late double scaleHeight;
  static late double scaleText;

  Future<void> init({bool minTextAdapt = false}) async {
    screenHeight =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
    screenWidth =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    scaleWidth = screenWidth / _uiSize.width;
    scaleHeight = screenHeight / _uiSize.height;
    scaleText = minTextAdapt ? min(scaleWidth, scaleHeight) : scaleWidth;
  }
}
