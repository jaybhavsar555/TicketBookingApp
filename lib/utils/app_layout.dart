import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class AppLayout{
  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }

  static getScreenHeight(){
    return Get.height; //400 pixels
  }

  static getScreenWidth(){
    return Get.width; //220 pixels
  }

  static getHeight(double pixel){
    double x=getScreenHeight()/pixel; //to get screen proportion 400/200 = 2
    return getScreenHeight()/x; //height value based on screen proportion
  }

  static getWidth(double pixel){
    double x=getScreenWidth()/pixel; //to get screen proportion 400/200 = 2
    return getScreenWidth()/x; //height value based on screen proportion
  }

}