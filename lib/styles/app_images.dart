import 'package:flutter_svg/svg.dart';

class AppImages {
  static SvgPicture menuIcon({double? height, double? width}) =>
      SvgPicture.asset(
        'lib/assets/menu.svg',
        semanticsLabel: 'Menu Icon',
        height: height,
        width: width,
      );

  static SvgPicture notificationIcon({double? height, double? width}) =>
      SvgPicture.asset(
        'lib/assets/notification.svg',
        semanticsLabel: 'Notification Icon',
        height: height,
        width: width,
      );

  static SvgPicture toolsIcon({double? height, double? width}) =>
      SvgPicture.asset(
        'lib/assets/tools.svg',
        semanticsLabel: 'Tools Icon',
        height: height,
        width: width,
      );

  static SvgPicture durationIcon({double? height, double? width}) =>
      SvgPicture.asset(
        'lib/assets/duration.svg',
        semanticsLabel: 'Duration Icon',
        height: height,
        width: width,
      );

  static SvgPicture priceIcon({double? height, double? width}) =>
      SvgPicture.asset(
        'lib/assets/price.svg',
        semanticsLabel: 'Price Icon',
        height: height,
        width: width,
      );

  static SvgPicture watchersIcon({double? height, double? width}) =>
      SvgPicture.asset(
        'lib/assets/watchers.svg',
        semanticsLabel: 'Watchers Icon',
        height: height,
        width: width,
      );

  static SvgPicture likesIcon({double? height, double? width}) =>
      SvgPicture.asset(
        'lib/assets/likes.svg',
        semanticsLabel: 'Likes Icon',
        height: height,
        width: width,
      );

  static SvgPicture starIcon({double? height, double? width}) =>
      SvgPicture.asset(
        'lib/assets/star.svg',
        semanticsLabel: 'Likes Icon',
        height: height,
        width: width,
      );
}
