import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';

class CustomTicketLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;
  const CustomTicketLayout({Key? key,required this.firstText, required this.secondText, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: alignment,

      children: [
        Text(firstText,style: Styles.ticketTextStyle1.copyWith(color: Colors.black),),
        Gap(AppLayout.getHeight(5)),
        Text(secondText,style:Styles.textHeadStyle4.copyWith(color: Colors.grey)),
      ],
    );
  }
}
