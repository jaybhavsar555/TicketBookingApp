import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/widget/customer_ticketLayout.dart';
import 'package:ticketbookapp/widget/horizontal_line_widget.dart';


import '../utils/app_layout.dart';
import '../utils/app_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout=AppLayout(context);
    // final Size size= appLayout.getSize();

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: appLayout.getHeight(20),
            vertical: appLayout.getWidth(30)),
        children: [
          Gap(appLayout.getHeight(40)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //profile pic
              Container(
                width: appLayout.getWidth(90),
                height: appLayout.getHeight(90),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/images/profile_pic.png"))),
              ),

              Gap(appLayout.getHeight(12)),

              //for the text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Book Tickets",
                    style: Styles.textHeadStyle1,
                  ),
                  Text("New-Delhi",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),

                  Gap(appLayout.getHeight(8)),

                  //Premium Badge
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFFFEF4F3),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF526799),
                          ),
                          child: const Icon(FluentIcons.shield_12_filled,
                              color: Colors.white, size: 15),
                        ),
                        Gap(appLayout.getHeight(7)),
                        const Text(
                          "Premium Status",
                          style: TextStyle(
                            color: Color(0xFF526799),
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                      ],
                    ),

                  ),

                ],
              ),
              const Spacer(),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      Fluttertoast.showToast(
                          msg: "Now u can edit...",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.grey,
                          fontSize: 16.0
                      );
                    },
                    child: Text("Edit", style: TextStyle(
                      color: Styles.primaryColor,
                      fontWeight: FontWeight.w400,

                    ),
                    ),
                  ),
                ],
              ),

            ],
          ),
          Gap(appLayout.getHeight(25)),

          //reward
          Stack(
            children: [
              Container(
                height: appLayout.getHeight(90),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Styles.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                right: -44,
                top: -39,
                child: Container(
                  padding:  EdgeInsets.all(appLayout.getHeight(33)),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.lightBlueAccent,width: 18,),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: appLayout.getHeight(30),
                    vertical: appLayout.getHeight(20)
                ),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CircleAvatar(
                    maxRadius: 25,
                      backgroundColor: Colors.white,
                    child: Icon(
                      FluentIcons.lightbulb_filament_16_filled,
                      color: Styles.primaryColor,
                      size: 27,
                    ),
                     ),
                    Gap(appLayout.getHeight(20)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("You'v got new reward ",
                          style: Styles.textHeadStyle2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),

                        Text("You have 100 Flights this year", style: Styles.textHeadStyle2.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        ),
                        ),
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
          Gap(appLayout.getHeight(7)),
          Text("Accumulated miles" ,style: Styles.textStyle1,),
          Gap(appLayout.getHeight(12)),
          Container(
            padding: EdgeInsets.all(appLayout.getHeight(15)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Styles.bgColor,
              boxShadow:[ BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 2,
                spreadRadius: 2

              )]
            ),
            child: Column(
              children: [
                Gap(appLayout.getHeight(10)),
                 Text("198709", style: TextStyle(fontSize: 40, color: Styles.textColor, fontWeight: FontWeight.w400
                 ),),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Miles accured",style: Styles.textHeadStyle4.copyWith(color: Colors.grey),),
                   Text("23 Oct 2023",style: Styles.textHeadStyle4.copyWith(color: Colors.grey),),
                 ],
               ),
                Gap(appLayout.getHeight(5)),
                Divider(color: Colors.grey.shade300,),
                Gap(appLayout.getHeight(4)),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    CustomTicketLayout(firstText: "23 000", secondText:"Miles", alignment: CrossAxisAlignment.start),
                    CustomTicketLayout(firstText: "AirLin India", secondText:"Recevied from", alignment: CrossAxisAlignment.end),
                  ],
                ),

                Gap(appLayout.getHeight(12)),
                const HorizontalLineWidget(section: 12, isColor: false,),
                Gap(appLayout.getHeight(12)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTicketLayout(firstText: "21 00", secondText:"Miles", alignment: CrossAxisAlignment.start),
                    CustomTicketLayout(firstText: "IndiGO", secondText:"Recevied from", alignment: CrossAxisAlignment.end),
                  ],
                ),
                Gap(appLayout.getHeight(12)),
                const HorizontalLineWidget(section: 12, isColor: false,),
                Gap(appLayout.getHeight(12)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTicketLayout(firstText: "41 000", secondText:"Miles", alignment: CrossAxisAlignment.start),
                    CustomTicketLayout(firstText: "Air India", secondText:"Recevied from", alignment: CrossAxisAlignment.end),
                  ],
                ),

              ],
            ),
          ),
          Gap(appLayout.getHeight(10)),
          InkWell(
            onTap: (){
              Fluttertoast.showToast(
                  msg: "Wait..",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.grey,
                  fontSize: 16.0
              );
            },
            child: Center(
              child: Text(
                "How to get more miles",
               style: Styles.textStyle1.copyWith(
                 color: Colors.blue
               ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
