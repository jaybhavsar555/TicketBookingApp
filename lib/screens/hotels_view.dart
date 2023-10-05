import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_layout.dart';
import 'package:ticketbookapp/utils/app_style.dart';

class HotelView extends StatelessWidget {
   final Map<String,dynamic> hotel;
   const HotelView({Key? key,required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= AppLayout.getSize(context);
    print("${hotel['price']}");
    return  Container(
      width: size.width * 0.6,
      height: size.height * 0.5,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      margin: EdgeInsets.only(right: 17,top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Styles.primaryColor,
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.primaryColor,
              image:  DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/${hotel['image']}"
                  )
              )
            ),
          ),
          Gap(10),
          Text("${hotel['hotel_name']}",
          style: Styles.textHeadStyle2.copyWith(color: Styles.kakiColor)
          ),
          Gap(5),
          Text("${hotel['destination']}",
              style: Styles.textHeadStyle3.copyWith(color:Colors.white)
          ),
          Gap(8),
          Text("\₹${hotel['price']}/night",
              style: Styles.textHeadStyle2.copyWith(color:Styles.kakiColor)
          ),
        ],
      ),
    );
  }
}
