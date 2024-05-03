import 'package:flutter/cupertino.dart';
class AppLayout{
   BuildContext context;

   AppLayout(this.context);

   Size getSize(){
    return MediaQuery.of(context).size;
  }

// Calculate height based on the ratio of the given pixel to the screen height
   double getHeight(double pixel) {
    double screenHeight = getSize().height;
    return screenHeight / (screenHeight / pixel);
  }

  // Calculate width based on the ratio of the given pixel to the screen width
   double getWidth(double pixel) {
    double screenWidth = getSize().width;
    return screenWidth / (screenWidth / pixel);
  }

}