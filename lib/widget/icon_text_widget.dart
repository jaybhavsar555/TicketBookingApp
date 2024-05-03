import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/utils/app_style.dart';

import '../utils/app_layout.dart';

class IconTextWidget extends StatelessWidget {
  final text;
  final icon;
  const IconTextWidget({super.key, required this.text , required this.icon});

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout=AppLayout(context);
    return   Builder(
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: appLayout.getHeight(12),horizontal: appLayout.getWidth(10)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(appLayout.getHeight(20)),
              color: Colors.white
          ),
          child:  Row(
            children: [

              Icon(icon,color: Colors.grey),
              Gap(appLayout.getHeight(10)),
              Text(text,style: Styles.textStyle1,),
            ],
          ),
        );
      }
    );
  }
}
