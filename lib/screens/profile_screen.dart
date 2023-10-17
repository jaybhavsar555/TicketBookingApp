import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getHeight(20),
            vertical: AppLayout.getHeight(30)),
        children: [
          Gap(AppLayout.getHeight(40)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //profile pic
              Container(
                width: AppLayout.getWidth(90),
                height: AppLayout.getHeight(90),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/images/profile_pic.png"))),
              ),
              Gap(AppLayout.getHeight(12)),

              //for the text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Book Tickets",
                    style: Styles.textHeadStyle1,
                  ),
                  Text("New-Delhi",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),

                  Gap(AppLayout.getHeight(8)),

                  //Premium Badge
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFFFEF4F3),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF526799),
                          ),
                          child: Icon(FluentIcons.shield_12_filled,
                              color: Colors.white, size: 15),
                        ),
                        Gap(AppLayout.getHeight(7)),
                        const Text(
                          "Premium Status",
                          style: TextStyle(
                            color: Color(0xFF526799),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              child: Text("Edit", style: TextStyle(
                                color: Styles.primaryColor,
                                fontWeight: FontWeight.w400,

                              ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                  ),

                ],
              ),
              Spacer(),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      Fluttertoast.showToast(
                          msg: "Now u can edit...",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    child: Text("Edit", style: TextStyle(
                      color: Styles.primaryColor,
                      fontWeight: FontWeight.w400,

                    ),
                    ),
                  )
                ],
              ),

            ],
          ),



        ],
      ),
    );
  }
}
