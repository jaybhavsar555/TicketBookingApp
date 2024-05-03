import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_layout.dart';
import 'package:ticketbookapp/utils/app_style.dart';
import 'package:ticketbookapp/widget/icon_text_widget.dart';
import 'package:ticketbookapp/widget/ticket_tab.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout=AppLayout(context);
    final size=appLayout.getSize();
    return  Scaffold(
     backgroundColor: Styles.bgColor,
      body: Builder(
        builder: (context) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal:20),
            children: [
              Gap(appLayout.getHeight(40)),

              Text("What are you\nlooking for?",style: Styles.textHeadStyle2.copyWith(fontSize: 35),),

              Gap(appLayout.getHeight(20)),

              const TicketTabWidget(firstTabText: "Airline Ticket", secondTabText: "Hotel",),
              Gap(appLayout.getHeight(20)),
              const IconTextWidget(text: "Departure ", icon: Icons.flight_takeoff_outlined ),
              Gap(appLayout.getHeight(15)),
              const IconTextWidget(text: "Arrival ", icon: Icons.flight_land_outlined ),
              Gap(appLayout.getHeight(15)),
              //Find ticket Button
              Container(
                    padding: EdgeInsets.symmetric(vertical: appLayout.getWidth(12),
                    horizontal: appLayout.getWidth(12)),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(appLayout.getHeight(20)),
                    color: const Color(0xD91130CE),
                ),
                     child: Center(
                         child:
                         Text(
                             "Find Ticket",
                             style: Styles.textStyle1.copyWith(color: Colors.white))),
                ),
              Gap(appLayout.getHeight(15)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Upcoming Flights", style: Styles.textHeadStyle2),
                  InkWell(
                    onTap: (){
                      print("To see the Tickets");
                      },
                    child: Text("view all", style: Styles.textStyle1),

                  ),


                ],
              ),
              Gap(appLayout.getHeight(12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: appLayout.getHeight(400),
                    width: size.width*0.40,
                    padding: EdgeInsets.symmetric(horizontal: appLayout.getWidth(10),vertical: appLayout.getHeight(15)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(appLayout.getHeight(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 5,
                          spreadRadius: 5,
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //image
                        Container(
                          height: appLayout.getHeight(190),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(appLayout.getHeight(20)),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage("assets/images/sit.jpg"),
                            )
                          ),
                        ),
                        Gap(appLayout.getHeight(17)),
                        Text("20% discounts on early bookings for this Flight. Dont miss.", style: Styles.textHeadStyle2.copyWith(fontSize: 20.1)),

                      ],
                    ),


                  ),
                  Column(
                    //Discount Survey
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: appLayout.getHeight(10), horizontal: appLayout.getHeight(15)),
                            height: appLayout.getHeight(200),
                            width: size.width*0.40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3AB8B8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Discount\nfor Survey", style: Styles.textHeadStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                                Gap(appLayout.getHeight(10)),
                                Text("Take survey about our services and get discounts ", style: Styles.textHeadStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18)),
                              ],
                            ),



                          ),
                         Positioned(
                           right: -50,top: -45,

                             child:  Container(
                           padding: EdgeInsets.all(appLayout.getHeight(30)),
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.transparent,
                               border: Border.all(color: const Color(0xFF189999) ,width: 18)
                           ) ,
                         ))
                        ],
                      ),
                      Gap(appLayout.getHeight(12)),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: appLayout.getHeight(10),horizontal: appLayout.getWidth(15)),
                        width: size.width*.44,
                        height: appLayout.getHeight(200),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(appLayout.getHeight(20)),

                          color: Colors.red,
                        ),
                        child: Column(
                          children: [
                            Text("Take love",style: Styles.textHeadStyle2.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                            Gap(appLayout.getHeight(10)),
                            RichText(
                                text:const TextSpan(
                                  children: [
                                    TextSpan(
                                      text:'😍',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    TextSpan(
                                      text:'😘',
                                      style: TextStyle(fontSize: 50),
                                    ),TextSpan(
                                      text:'🤩',
                                      style: TextStyle(fontSize: 30),
                                    ),

                                  ]
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        }
      ),
    );
  }
}
