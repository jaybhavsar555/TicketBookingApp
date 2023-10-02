import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_style.dart';

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
                       width: 50,
                       height: 50,
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
                   const Gap(25),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius:  BorderRadius.circular(15),
                       color: Colors.white

                     ),
                     padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.search_outlined,color: Colors.blueGrey),

                        Text("Search",style: Styles.textHeadStyle4)
                      ],
                  ),
                   ),
                      const Gap(10),
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
            )
            ],
          ),

    );
  }
}
