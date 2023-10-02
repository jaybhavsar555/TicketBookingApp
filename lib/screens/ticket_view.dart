import 'package:flutter/material.dart';
import 'package:ticketbookapp/utils/app_layout.dart';
import 'package:ticketbookapp/utils/app_style.dart';
import 'package:ticketbookapp/widget/round_container.dart';

class TicketView extends StatelessWidget {
  const TicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= AppLayout.getSize(context);
    return  SizedBox(
        width: size.width,
      height: 200,

      child: Container(
        margin: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
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
                      Text("DEl",style: Styles.ticketTextStyle1,),
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

                      Text("BOM",style: Styles.ticketTextStyle1,),
                    ],
                  )
                ],
              ),
            ),
            // const Divider(
            //   color: Colors.white,
            //   thickness: 5,
            //   height: 0.1,
            //
            //
            // ),

            Container(
              // color: Colors.red,
              padding: const EdgeInsets.all(16),
            )

          ],
        ),
      ),
    );
  }
}
