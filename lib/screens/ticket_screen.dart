import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/widget/customer_ticketLayout.dart';
import 'package:ticketbookapp/widget/horizontal_line_widget.dart';
import 'package:ticketbookapp/widget/ticket_view.dart';
import 'package:ticketbookapp/utils/app_style.dart';
import 'package:ticketbookapp/utils/hotel_info_list.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../utils/app_layout.dart';
import '../widget/ticket_tab.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout=AppLayout(context);
    // final size= appLayout.getSize();

    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(vertical: appLayout.getHeight(10),
                    horizontal: appLayout.getWidth(15),
                ),


                children: [

                  Gap(appLayout.getHeight(40)),

                  Text("Tickets",style: Styles.textHeadStyle1,),
                  Gap(appLayout.getHeight(15)),
                  //tab
                  const TicketTabWidget(firstTabText: "Upcoming", secondTabText: "Previous",),

                  Gap(appLayout.getHeight(20)),

                  Container(
                    padding: EdgeInsets.only(left: appLayout.getHeight(25)),
                    child: TicketView(ticket: ticketInfo[0],isColor: true,),
                  ),
                  const SizedBox(height: 0.8,),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                    margin: const EdgeInsets.only(left: 25,right: 17),
                    // width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,

                    ),

                    child:  Column(

                      children: [

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            CustomTicketLayout(
                                firstText: "FlutterDB",
                                secondText: "Passenger",
                              alignment: CrossAxisAlignment.start,
                            ),
                            CustomTicketLayout(
                                firstText: "1234 135512",
                                secondText: "Passport",
                              alignment: CrossAxisAlignment.end,
                            ),
                          ],
                        ),
                        Gap(appLayout.getHeight(20)),
                        const HorizontalLineWidget(section: 10,isColor: false, width: 5),
                        Gap(appLayout.getHeight(20)),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            CustomTicketLayout(
                              firstText: "0077 7457 4574 23",
                              secondText: "Number Of E-tickets",
                              alignment: CrossAxisAlignment.start,
                            ),
                            CustomTicketLayout(
                              firstText: "BS2GS34",
                              secondText: "Booking Code",
                              alignment: CrossAxisAlignment.end,
                            ),
                          ],
                        ),


                        Gap(appLayout.getHeight(20)),
                        const HorizontalLineWidget(section: 10,isColor: false, width: 5),
                        Gap(appLayout.getHeight(20)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/visa12.png", scale: 29,),
                                    Text("  ****2789",style: Styles.ticketTextStyle1.copyWith(color: Colors.black),),
                                  ],
                                ),
                                Text("Payment Method",style: Styles.textHeadStyle4.copyWith(color: Colors.grey)),
                              ],
                            ),
                             const Column(

                              children: [
                                CustomTicketLayout(
                                  firstText: "₹2000",
                                  secondText: "Price",
                                  alignment: CrossAxisAlignment.end,
                                ),
                              ],
                            )

                          ],
                        ),
                        Gap(appLayout.getHeight(20)),
                        const HorizontalLineWidget(section: 10,isColor: false, width: 5),



                      ],
                    ),

                  ),
                  //barcode
                  Container(
                    margin:  EdgeInsets.only(left: appLayout.getHeight(25),right: appLayout.getHeight(17)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(appLayout.getHeight(21)),
                          bottomRight: Radius.circular(appLayout.getHeight(21))),
                      color: Colors.white,

                    ),
                    child: Container(
                    padding: EdgeInsets.symmetric(vertical: appLayout.getHeight(10),
                                horizontal: appLayout.getWidth(20)),
                      // color: Colors.red,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(appLayout.getHeight(15)),
                        child: BarcodeWidget(
                          data: "https://github.com",
                          barcode: Barcode.code128(),
                          drawText: false,
                          color: Styles.textColor,
                          width: double.infinity,
                          height:appLayout.getHeight(70),

                        ),
                      ),
                    ),
                  ),
                  Gap(appLayout.getHeight(20)),
                  Container(
                    padding: EdgeInsets.only(left: appLayout.getHeight(25)),
                    child: TicketView(ticket: ticketInfo[0],),
                  ),
                ],
              ),
              Positioned(
                left: appLayout.getHeight(22),
                top:appLayout.getHeight(295),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Styles.textColor,width: 2),
                  ),
                  child: CircleAvatar(
                    maxRadius: 4,
                    backgroundColor: Styles.textColor,
                  ),
                ),
              ),
              Positioned(
                right: appLayout.getHeight(22),
                top:appLayout.getHeight(295),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Styles.textColor,width: 2),
                  ),
                  child: CircleAvatar(
                    maxRadius: 4,
                    backgroundColor: Styles.textColor,
                  ),
                ),
              )

            ],
          );
        }
      ),
    );
  }
}
