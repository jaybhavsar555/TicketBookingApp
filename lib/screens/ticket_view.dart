import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_layout.dart';
import 'package:ticketbookapp/utils/app_style.dart';
import 'package:ticketbookapp/widget/round_container.dart';

class TicketView extends StatelessWidget {
  const TicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= AppLayout.getSize(context);
    return  SizedBox(
        width: size.width*0.85,
        height: 200,

      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            /*
                  Showing the blue part of the ticket
            * */
            Container(

              decoration: const BoxDecoration(
                color: Color(0xFF526799),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21),topRight: Radius.circular(21)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("DEL",style: Styles.ticketTextStyle1,),
                      const Spacer(),
                      const RoundContainer(),
                      Expanded(child:
                      Stack(
                        children: [SizedBox(
                          height: 24,

                          child: LayoutBuilder(
                            builder: (BuildContext context,BoxConstraints constraint) {
                              print("this is width ${constraint.constrainWidth()}");
                              return Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate((constraint.constrainWidth()/6).floor(),(index) => const SizedBox(
                                  width: 3,height: 1, child: DecoratedBox(
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

                      Text("PUN",style: Styles.ticketTextStyle1,),




                    ],
                  ),
                   Gap(5),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text("New Delhi", style: Styles.textHeadStyle4.copyWith(color: Colors.white),),
                      ),


                      Text("6H 30M", style: Styles.textHeadStyle4.copyWith(color: Colors.white)),

                      SizedBox(
                        width: 100,
                        child: Text("Pune", style: Styles.textHeadStyle4.copyWith(color: Colors.white), textAlign: TextAlign.end,),
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
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Styles.bgColor,
                        borderRadius: const BorderRadius.only(
                         topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: LayoutBuilder(
                           builder: (BuildContext context, BoxConstraints constraints){
                           return  Flex(
                             direction: Axis.horizontal,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                               width: 3,height: 1, child: DecoratedBox(
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
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Styles.bgColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
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
              padding: const EdgeInsets.only(left: 16,top: 10,right: 16,bottom: 16),
              decoration:  BoxDecoration(
                color: Styles.orangeColor,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21)),

              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Column(
                          children: [
                            Text("10 Oct", style: Styles.textHeadStyle3.copyWith(color: Colors.white),),
                            const Gap(5),
                            Text("Date",style: Styles.textHeadStyle4.copyWith(color: Colors.white),),
                          ],
                        ),
                      Column(
                        children: [
                          Text("6:00PM", style: Styles.textHeadStyle3.copyWith(color: Colors.white),),
                          Gap(5),
                          Text("Departure Time",style: Styles.textHeadStyle4.copyWith(color: Colors.white),),
                        ],
                      ),

                      Column(
                        children: [
                          Text("10 Oct", style: Styles.textHeadStyle3.copyWith(color: Colors.white),),
                          Gap(5),
                          Text("Date",style: Styles.textHeadStyle4.copyWith(color: Colors.white),),
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
