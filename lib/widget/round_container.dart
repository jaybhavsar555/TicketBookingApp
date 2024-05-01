import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final bool? isColor;
  const RoundContainer({super.key, this.isColor});

  @override
  Widget build(BuildContext context) {
    return  Builder(
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2.7, color: isColor==null? Colors.white: Colors.cyan),
          ),
        );
      }
    );
  }
}
