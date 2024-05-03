import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

class TicketTabWidget extends StatelessWidget {

  final  firstTabText;
  final  secondTabText;
  const TicketTabWidget({super.key, required this.firstTabText, required this.secondTabText});

  @override
  Widget build(BuildContext context) {

    final AppLayout appLayout=AppLayout(context);
    final size=appLayout.getSize();

    return  FittedBox(
      child: Container(
        padding: const EdgeInsets.all(3.5),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(appLayout.getHeight(50)),

        ),
        child: Row(
          children: [
            // Airline Ticket
            Container(
              width: size.width*.44,
              padding: EdgeInsets.symmetric(vertical: appLayout.getHeight(7)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(appLayout.getHeight(50))),
                color: Colors.white,

              ),
              child:  Center(child: Text(firstTabText)),
            ),
            //hotel ticket
            Container(
              width: size.width*.44,
              padding: EdgeInsets.symmetric(vertical: appLayout.getHeight(7)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(right: Radius.circular(appLayout.getHeight(50))),
                color: Colors.transparent,

              ),
              child:  Center(child: Text(secondTabText)),
            ),

          ],
        ),
      ),
    );
  }
}
