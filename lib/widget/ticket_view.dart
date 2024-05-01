import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_layout.dart';
import 'package:ticketbookapp/utils/app_style.dart';
import 'package:ticketbookapp/widget/horizontal_line_widget.dart';
import 'package:ticketbookapp/widget/round_container.dart';

class TicketView extends StatelessWidget {
  final Map<String,dynamic> ticket;
  final bool? isColor;

   const TicketView({super.key, required this.ticket,this.isColor});

  @override
  Widget build(BuildContext context) {
    final size= AppLayout.getSize(context);
    // print("from: ${ticket["from"]["name"]}");
    return  Builder(
      builder: (context) {
        return SizedBox(
            width: size.width * 0.85,
            height: AppLayout.getHeight(181),

          child: Container(
            margin:  EdgeInsets.only(right: AppLayout.getHeight(17)),
            child: Column(
             mainAxisSize: MainAxisSize.min,
              children: [
                /*
                      Showing the blue part of the ticket
                * */
                Container(
                  decoration:  BoxDecoration(
                    color: isColor==null? const Color(0xFF526799): Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)),
                        topRight: Radius.circular(AppLayout.getHeight(21))
                    ),
                  ),
                  padding:  EdgeInsets.all(AppLayout.getHeight(16)),
                  child: Column(
                    children: [

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${ticket["from"]["code"]}",
                            style: isColor==null? Styles.ticketTextStyle1:Styles.ticketTextStyle1.copyWith(color: Colors.black) ,), //from code
                          const Spacer(),
                          const RoundContainer(isColor:true,),
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
                                      width: AppLayout.getWidth(3),height: AppLayout.getHeight(1), child:  DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: isColor==null? Colors.white : Colors.cyan
                                      ),
                                    ),
                                    )
                                    ),
                                  );
                                }
                              ),
                            ),

                              Center(child: Transform.rotate(angle: 1.5,child:  Icon(Icons.local_airport,color:isColor==null? Colors.white: Colors.cyan,),),),

                            ]
                          ),
                          ),
                           const RoundContainer(isColor: true,),
                          const Spacer(),

                          Text("${ticket["to"]["code"]}",style: isColor==null? Styles.ticketTextStyle1: Styles.ticketTextStyle1.copyWith(color: Colors.black),), //to code




                        ],
                      ),
                       const Gap(5),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //from name
                          SizedBox(
                            width: AppLayout.getWidth(100),
                            child: Text("${ticket["from"]["name"]}", style:isColor==null? Styles.textHeadStyle4.copyWith(color: Colors.white):Styles.textHeadStyle4.copyWith(color: Colors.grey),),
                          ),


                          Text("6H 30M", style: isColor==null? Styles.textHeadStyle4.copyWith(color: Colors.white): Styles.textHeadStyle4.copyWith(color: Colors.grey) ),
                          //to name
                          SizedBox(
                            width: AppLayout.getWidth(100),
                            child: Text("${ticket["to"]["name"]}", style: isColor==null? Styles.textHeadStyle4.copyWith(color: Colors.white): Styles.textHeadStyle4.copyWith(color: Colors.grey), textAlign: TextAlign.end,),
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
                  color: isColor==null?Styles.orangeColor: Colors.white,

                  child:  Row(
                    children: [
                      SizedBox(
                        height: AppLayout.getHeight(20),
                        width: AppLayout.getWidth(10),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: isColor==null? Styles.bgColor: Colors.white,
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
                            child: const HorizontalLineWidget(section: 15,),
                          )
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(20),
                        width: AppLayout.getWidth(10),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: isColor==null? Styles.bgColor: Colors.white,
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
                    color: isColor==null? Styles.orangeColor:Colors.white,
                    borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(isColor==null? AppLayout.getHeight(21):0),
                        bottomRight: Radius.circular(isColor==null? AppLayout.getWidth(21):0)),

                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ticket["date"], style: isColor==null? Styles.ticketTextStyle1.copyWith(color: Colors.white): Styles.ticketTextStyle1.copyWith(color: Colors.black),),
                                const Gap(5),
                                Text("Date",style:isColor==null? Styles.textHeadStyle4.copyWith(color: Colors.white): Styles.textHeadStyle4.copyWith(color: Colors.grey),),
                              ],
                            ),
                          Column(
                            children: [
                              Text("${ticket["departureTime"]}", style:isColor==null? Styles.textHeadStyle3.copyWith(color: Colors.white):Styles.textHeadStyle3.copyWith(color: Colors.black),),
                              const Gap(5),
                              Text("Departure Time",style:isColor==null? Styles.textHeadStyle4.copyWith(color: Colors.white):Styles.textHeadStyle4.copyWith(color: Colors.grey),),
                            ],
                          ),

                          Column(
                            children: [
                              Text("${ticket["number"]}", style:isColor==null? Styles.ticketTextStyle1.copyWith(color: Colors.white):Styles.ticketTextStyle1.copyWith(color: Colors.black),),
                              const Gap(5),
                              Text("Number",style:isColor==null? Styles.textHeadStyle4.copyWith(color: Colors.white):Styles.textHeadStyle4.copyWith(color: Colors.grey),),
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
    );
  }
}
