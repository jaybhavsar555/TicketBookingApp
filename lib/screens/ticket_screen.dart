import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/screens/ticket_view.dart';
import 'package:ticketbookapp/utils/app_style.dart';
import 'package:ticketbookapp/utils/hotel_info_list.dart';

import '../utils/app_layout.dart';
import '../widget/ticket_tab.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(25), horizontal: AppLayout.getWidth(20)),

            children: [
              Gap(AppLayout.getHeight(40)),

              Text("Tickets",style: Styles.textHeadStyle1,),
              Gap(AppLayout.getHeight(15)),
              const TicketTabWidget(firstTabText: "Upcoming", secondTabText: "Previous",),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketInfo[0],isColor: true,),
              )
            ],
          )
        ],
      ),
    );
  }
}
