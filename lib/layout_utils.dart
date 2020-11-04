import 'package:flutter/material.dart';

class LayoutUtils {
  static double getWindowWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isMobileLayout(BuildContext context) {
    return getWindowWidth(context) < 750;
  }

  static bool isLargeLayout(BuildContext context) {
    return getWindowWidth(context) > 1400;
  }
}
