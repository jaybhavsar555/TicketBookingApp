import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_layout.dart';
import 'package:ticketbookapp/utils/app_style.dart';

class HotelView extends StatelessWidget {
   final Map<String,dynamic> hotel;
   const HotelView({super.key,required this.hotel});

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout=AppLayout(context);
    final size= appLayout.getSize();
    // print("${hotel['price']}");
    return  Builder(
      builder: (context) {
        return Container(
          width:appLayout.getWidth(size.width * 0.6) ,
          height:appLayout.getHeight(350) ,
          margin: EdgeInsets.only(right: appLayout.getHeight(13),top: appLayout.getWidth(10)),
          padding: EdgeInsets.all(appLayout.getHeight(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Styles.primaryColor,

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: appLayout.getHeight(185),
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
              const Gap(10),
              Text("${hotel['hotel_name']}",
              style: Styles.textHeadStyle2.copyWith(color: Styles.kakiColor)
              ),
              const Gap(5),
              Text("${hotel['destination']}",
                  style: Styles.textHeadStyle3.copyWith(color:Colors.white)
              ),
              const Gap(8),
              Text("₹${hotel['price']}/night",
                  style: Styles.textHeadStyle2.copyWith(color:Styles.kakiColor)
              ),
            ],
          ),
        );
      }
    );
  }
}
