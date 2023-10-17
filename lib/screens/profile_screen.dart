import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20), vertical: AppLayout.getHeight(30)),
        children: [
          Gap(AppLayout.getHeight(40)),
          Row(
                children: [
                  //profile pic
                  Container(
                    width: AppLayout.getWidth(90),
                    height: AppLayout.getHeight(90),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage("assets/images/profile_pic.png")
                        )
                    ),

                  ),
                  Gap(AppLayout.getHeight(10)),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Book Tickets",style: Styles.textHeadStyle1,),
                      Text("New-Delhi",style: TextStyle(
                        fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.shade500
                      )),
                      Gap(AppLayout.getHeight(8)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey,

                        ),
                        child: Row(
                          children: [

                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                
                              ),
                              child: Icon(FluentIcons.shield_12_filled),
                            ),

                          ],
                        ),
                      )

                    ],
                  )

                ],
              ),

            ],
      ),
    );
  }
}
