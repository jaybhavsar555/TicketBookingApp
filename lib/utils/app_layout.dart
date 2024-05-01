import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class AppLayout{

  static getSize(BuildContext context){
    return MediaQuery.of(context).size;

  }

  static getScreenHeight(){
    return Get.height?? 400; //400 pixels
  }

  static getScreenWidth(){
    return Get.width ??300; //220 pixels
  }

  // static getHeight(double pixel){
  //   final screenHeight=getScreenHeight()??0.00;
  //   if (screenHeight == null) return 0.0;
  //   double x=screenHeight/pixel;
  //   return getScreenHeight()/x;
  // }
  //
  // static getWidth(double pixel){
  //   final screenWidth=getScreenWidth()??0.00;
  //   if(screenWidth==null) return 0.00;
  //   double x=getScreenWidth()/pixel; //to get screen proportion 400/200 = 2
  //   return getScreenWidth()/x; //height value based on screen proportion
  // }

// Calculate height based on the ratio of the given pixel to the screen height
  static double getHeight(double pixel) {
    double screenHeight = getScreenHeight(); // This is never null due to the default value
    return screenHeight / (screenHeight / pixel);
  }

  // Calculate width based on the ratio of the given pixel to the screen width
  static double getWidth(double pixel) {
    double screenWidth = getScreenWidth(); // This is never null due to the default value
    return screenWidth / (screenWidth / pixel);
  }

}