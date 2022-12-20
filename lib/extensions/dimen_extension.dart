import 'dart:math';
import 'package:flutter/material.dart';
import '../helpers/screen_utils.dart';

extension DimenExtension on num {
  double get w => setWidth(this);

  double get h => setHeight(this);

  double get sh => ScreenUtils.screenHeight * this;

  double get sw => ScreenUtils.screenWidth * this;

  Widget get verticalSpace => SizedBox(height: setHeight(this));

  Widget get horizontalSpace => SizedBox(width: setWidth(this));

  double get r => radius(this);

  double get sp => setSp(this);

  double setSp(num fontSize) => fontSize * ScreenUtils.scaleText;

  double setWidth(num width) => width * ScreenUtils.scaleWidth;

  double setHeight(num height) => height * ScreenUtils.scaleHeight;

  double radius(num r) =>
      r * min(ScreenUtils.scaleWidth, ScreenUtils.scaleHeight);
}
