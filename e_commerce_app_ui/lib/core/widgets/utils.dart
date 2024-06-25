import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

AppBar buildAppBar({Color color = Colors.white, Color iconColor = kTextColor}) {
  return AppBar(
    backgroundColor: color,
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        "assets/icons/back.svg",
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/cart.svg",
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
      const SizedBox(width: kDefaultPadding / 2),
    ],
  );
}
