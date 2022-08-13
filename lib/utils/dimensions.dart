import "package:get/get.dart";

class Dimensions {
  static const double myScreenHeight = 844.08;
  static const double myScreenWidth = 390;

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewController = screenHeight / (myScreenHeight / 220);
  static double pageViewTextController = screenHeight / (myScreenHeight / 120);
  static double pageViewContainer = screenHeight / (myScreenHeight / 320);

  static double height10 = screenHeight / (myScreenHeight / 10);
  static double height15 = screenHeight / (myScreenHeight / 15);
  static double height20 = screenHeight / (myScreenHeight / 20);
  static double height30 = screenHeight / (myScreenHeight / 30);
  static double height45 = screenHeight / (myScreenHeight / 45);

  static double width10 = screenHeight / (myScreenHeight / 10);
  static double width15 = screenHeight / (myScreenHeight / 15);
  static double width20 = screenHeight / (myScreenHeight / 20);
  static double width30 = screenHeight / (myScreenHeight / 30);
  static double width45 = screenHeight / (myScreenHeight / 45);

  // font sizes
  static double font16 = screenHeight / 52.7;
  static double font20 = screenHeight / (myScreenHeight / 20);
  static double font26 = screenHeight / 32.46;

  // radius sizes
  static double radius15 = screenHeight / (myScreenHeight / 15);
  static double radius20 = screenHeight / (myScreenHeight / 20);
  static double radius30 = screenHeight / (myScreenHeight / 30);

  // icon sizes
  static double iconSize24 = screenHeight / (myScreenHeight / 24);
  static double iconSize16 = screenHeight / 52.75;

  // listview size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;
  static double listViewTextContSize2 = screenWidth / 3.0;

  // popular food
  static double popularFoodImgSize = screenHeight / 2.41;

  // bottom height
  static double bottomHeight = screenHeight / 7.03;

  // splash screen dimensions
  static double splashImage = screenHeight / 3.375;
}
