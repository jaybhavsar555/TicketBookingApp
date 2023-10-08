import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_layout.dart';
import 'package:ticketbookapp/utils/app_style.dart';
import 'package:ticketbookapp/widget/icon_text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=AppLayout.getSize(context);
    return  Scaffold(
     backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15), horizontal: AppLayout.getWidth(20)),
        children: [
          Gap(AppLayout.getHeight(40)),

          Text("What are you\nlooking for?",style: Styles.textHeadStyle2.copyWith(fontSize: 35),),

          Gap(AppLayout.getHeight(20)),

          FittedBox(
            child: Container(
              padding: const EdgeInsets.all(3.5),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(50)),

              ),
              child: Row(
                children: [
                 // Airline Ticket
                  Container(
                    width: size.width*.44,
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(AppLayout.getHeight(50))),
                    color: Colors.white,

                  ),
                    child: const Center(child: Text('Airline Ticket')),
                  ),
                  //hotel ticket
                  Container(
                    width: size.width*.44,
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(AppLayout.getHeight(50))),
                      color: Colors.transparent,

                    ),
                    child: const Center(child: Text('Hotel Ticket')),
                  ),
            ],
            ),

    ),
          ),
          Gap(AppLayout.getHeight(20)),
         const IconTextWidget(text: "Departure ", icon: Icons.flight_takeoff_outlined ),
          Gap(AppLayout.getHeight(15)),
          const IconTextWidget(text: "Arrival ", icon: Icons.flight_land_outlined ),
          Gap(AppLayout.getHeight(15)),
          Container(
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(12),horizontal: AppLayout.getWidth(10)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                color: Color(0xD91130CE),
            ),
                 child: Center(
                     child:
                     Text(
                         "Find Ticket",
                         style: Styles.textStyle1.copyWith(color: Colors.white))),
            ),


        ],
      ),
    );
  }
}
