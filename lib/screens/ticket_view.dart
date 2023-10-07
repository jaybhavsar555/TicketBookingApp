import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_layout.dart';
import 'package:ticketbookapp/utils/app_style.dart';
import 'package:ticketbookapp/widget/round_container.dart';

class TicketView extends StatelessWidget {
  final Map<String,dynamic> ticket;

   const TicketView({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= AppLayout.getSize(context);
    // print("from: ${ticket["from"]["name"]}");
    return  SizedBox(
        width: AppLayout.getWidth(size.width),
        height: AppLayout.getHeight(200),

      child: Container(
        margin:  EdgeInsets.only(right: AppLayout.getHeight(17)),
        child: Column(
          children: [
            /*
                  Showing the blue part of the ticket
            * */
            Container(
              decoration:  BoxDecoration(
                color: Color(0xFF526799),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)),topRight: Radius.circular(AppLayout.getHeight(21))),
              ),
              padding:  EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${ticket["from"]["code"]}",style: Styles.ticketTextStyle1,), //from code
                      const Spacer(),
                      const RoundContainer(),
                      Expanded(child:
                      Stack(
                        children: [SizedBox(
                          height: AppLayout.getHeight(24),

                          child: LayoutBuilder(
                            builder: (BuildContext context,BoxConstraints constraint) {
                              print("this is width ${constraint.constrainWidth()}");
                            return Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate((constraint.constrainWidth()/6).floor(),(index) =>  SizedBox(
                                  width: AppLayout.getWidth(3),height: AppLayout.getHeight(1), child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                ),
                                )
                                ),
                              );
                            }
                          ),
                        ),

                          Center(child: Transform.rotate(angle: 1.5,child: const Icon(Icons.local_airport,color: Colors.white,),),),

                        ]
                      ),
                      ),
                       const RoundContainer(),
                      const Spacer(),

                      Text("${ticket["to"]["code"]}",style: Styles.ticketTextStyle1,), //to code




                    ],
                  ),
                   Gap(5),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //from name
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text("${ticket["from"]["name"]}", style: Styles.textHeadStyle4.copyWith(color: Colors.white),),
                      ),


                      Text("6H 30M", style: Styles.textHeadStyle4.copyWith(color: Colors.white)),
                      //to name
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text("${ticket["to"]["name"]}", style: Styles.textHeadStyle4.copyWith(color: Colors.white), textAlign: TextAlign.end,),
                      ),

                    ],
                  )

                ],
              ),
            ),
            /*
                  Showing the red part of the ticket
            * */
            Container(
              color: Styles.orangeColor,

              child:  Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Styles.bgColor,
                        borderRadius:  BorderRadius.only(
                         topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getWidth(10)),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                        padding:  EdgeInsets.all(AppLayout.getHeight(12)),
                        child: LayoutBuilder(
                           builder: (BuildContext context, BoxConstraints constraints){
                           return  Flex(
                             direction: Axis.horizontal,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: List.generate((constraints.constrainWidth()/15).floor(), (index) =>  SizedBox(
                               width: AppLayout.getWidth(3),height: AppLayout.getHeight(1), child: const DecoratedBox(
                               decoration: BoxDecoration(
                                   color: Colors.white
                               ),
                             ),
                             )
                             ),
                           );
                  },
                        ),
                      )
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Styles.bgColor,
                          borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(AppLayout.getHeight(10)),
                            bottomLeft: Radius.circular(AppLayout.getWidth(10)),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*
                  Showing the Bottom part of the ticket
            * */
            Container(
              padding:  EdgeInsets.only(left:AppLayout.getHeight(16),top: AppLayout.getWidth(10),right: AppLayout.getHeight(16),bottom: AppLayout.getWidth(16)),
              decoration:  BoxDecoration(
                color: Styles.orangeColor,
                borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                    bottomRight: Radius.circular(AppLayout.getWidth(21))),

              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Column(
                          children: [
                            Text("${ticket["date"]}", style: Styles.textHeadStyle3.copyWith(color: Colors.white),),
                            const Gap(5),
                            Text("Date",style: Styles.textHeadStyle4.copyWith(color: Colors.white),),
                          ],
                        ),
                      Column(
                        children: [
                          Text("${ticket["departureTime"]}", style: Styles.textHeadStyle3.copyWith(color: Colors.white),),
                          Gap(5),
                          Text("Departure Time",style: Styles.textHeadStyle4.copyWith(color: Colors.white),),
                        ],
                      ),

                      Column(
                        children: [
                          Text("${ticket["number"]}", style: Styles.textHeadStyle3.copyWith(color: Colors.white),),
                          Gap(5),
                          Text("Number",style: Styles.textHeadStyle4.copyWith(color: Colors.white),),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
