import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final bool? isColor;
  const RoundContainer({Key? key, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2.7, color: isColor==null? Colors.white: Colors.cyan),
      ),
    );
  }
}
