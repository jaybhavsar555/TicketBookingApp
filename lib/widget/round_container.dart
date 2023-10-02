import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2.7, color: Colors.white),
      ),
    );
  }
}
