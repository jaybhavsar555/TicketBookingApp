import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/widget/ticket_view.dart';
import 'package:ticketbookapp/utils/app_layout.dart';
import 'package:ticketbookapp/utils/app_style.dart';
import 'package:ticketbookapp/utils/hotel_info_list.dart';

import 'hotels_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Styles.bgColor,
          body: ListView(

            children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // color: Colors.grey,
              child:  Column(

                children: [
                  const Gap(60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Good Morning",style: Styles.textHeadStyle3),
                          const Gap(2),
                          Text("Book Tickets",style:Styles.textHeadStyle1),
                        ],
                      ),
                     Container(
                       width: AppLayout.getWidth(50),
                       height: AppLayout.getHeight(50),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         image: const DecorationImage(
                           fit: BoxFit.fitHeight,
                             image: AssetImage("assets/images/ticket.png")
                         )
                       ),

                     ),


                    ],
                  ),
                   const Gap(30),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius:  BorderRadius.circular(15),
                       color: Colors.white

                     ),
                     padding:  EdgeInsets.symmetric(horizontal: AppLayout.getWidth(12),vertical: AppLayout.getHeight(12)),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.search_outlined,color: Colors.blueGrey),

                        Text("Search",style: Styles.textHeadStyle4)
                      ],
                  ),
                   ),
                      const Gap(30),
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
                  )

                ],
              ),
            ),

              const Gap(15),
               // for ticket
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: AppLayout.getHeight(17)),
                  child:
                  Row(
                    children: ticketInfo.map((ticket) => TicketView(ticket: ticket,isColor: null,)).toList(),
                  ),
              ),
              Container(
                padding:  EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hotels", style: Styles.textHeadStyle2),
                    InkWell(
                      onTap: (){
                        print("To see the hotel");
                      },
                      child: Text("view all", style: Styles.textStyle1),

                    ),
                  ],
                ),
              ),
              const Gap(15),
               //for hotels list
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: AppLayout.getHeight(17)),

                child: Row(
                  children: hotelsList.map((e) => HotelView(hotel: e)).toList(),
                ),
              )
            ],
          ),

    );
  }
}
