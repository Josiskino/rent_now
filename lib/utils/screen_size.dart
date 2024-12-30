import 'package:flutter/widgets.dart';

class SizeUtil {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  // Breakpoints
  static late bool isSmallScreen;
  static late bool isMediumScreen;
  static late bool isLargeScreen;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    // Define breakpoints
    isSmallScreen = screenWidth < 600;
    isMediumScreen = screenWidth >= 600 && screenWidth < 1200;
    isLargeScreen = screenWidth >= 1200;
  }

  static double widthPercentage(double percentage) {
    return blockSizeHorizontal * percentage;
  }

  static double heightPercentage(double percentage) {
    return blockSizeVertical * percentage;
  }

  static double textSize(double size) {
    return blockSizeHorizontal * size;
  }
  
  static double iconSize(double size) {
    return blockSizeHorizontal * size;
  }

  static double spacing(double size) {
    return blockSizeHorizontal * size;
  }
}
