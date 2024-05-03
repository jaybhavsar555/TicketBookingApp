import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';

class CustomTicketLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;
  const CustomTicketLayout({super.key,required this.firstText, required this.secondText, required this.alignment});

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout=AppLayout(context);
    return  Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: alignment,

          children: [
            Text(firstText,style: Styles.ticketTextStyle1.copyWith(color: Colors.black),),
            Gap(appLayout.getHeight(5)),
            Text(secondText,style:Styles.textHeadStyle4.copyWith(color: Colors.grey)),
          ],
        );
      }
    );
  }
}
