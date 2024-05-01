import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

class HorizontalLineWidget extends StatelessWidget {
  final bool? isColor;
  final int section;
  final double width;

  const HorizontalLineWidget({super.key,required this.section, this.isColor, this.width=3.0});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return  Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate((constraints.constrainWidth()/section).floor(), (index) =>  SizedBox(
                width: width,height: AppLayout.getHeight(1), child:  DecoratedBox(
                decoration: BoxDecoration(
                    color: isColor==null? Colors.white: Colors.black38
                ),
              ),
              )
              ),
            );
          },
        );
      }
    );
  }
}
