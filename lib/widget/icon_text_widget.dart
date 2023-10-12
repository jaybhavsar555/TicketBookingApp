import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_style.dart';

import '../utils/app_layout.dart';

class IconTextWidget extends StatelessWidget {
  final text;
  final icon;
  const IconTextWidget({Key? key, required this.text , required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(12),horizontal: AppLayout.getWidth(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
          color: Colors.white
      ),
      child:  Row(
        children: [

          Icon(icon,color: Colors.grey),
          Gap(AppLayout.getHeight(10)),
          Text(text,style: Styles.textStyle1,),
        ],
      ),
    );
  }
}
