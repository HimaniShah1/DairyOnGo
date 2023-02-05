import 'package:get/get.dart';

//We need dynamic dimensions of containers,text etc of our app so that our ui looks fine on all dimensions of devices

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer =
      screenHeight / 3.84; //slideshow image container
  static double pageViewTextContainer =
      screenHeight / 7.03; //slideshow text container
  static double pageView = screenHeight / 2.64;

  //dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height15 = screenHeight / 56.27;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.75;

  //dynamic width padding and margin
  static double width10 = screenHeight / 84.4;
  static double width20 = screenHeight / 42.2;
  static double width15 = screenHeight / 56.27;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.75;

  //font size
  static double font12 = screenHeight / 70.33; //small text
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2; //Big text
  static double font26 = screenHeight / 32.46;

  //dynamic radius
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;
  static double radius15 = screenHeight / 56.27;

  //icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  //list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //Recommended product
  static double recommendedProductImgSize = screenHeight / 2.41;

  //bottom height
  static double bottomHeightBar = screenHeight / 7.03;
}
