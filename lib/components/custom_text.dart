import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String myText;
  final Color myTextColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;

  const CustomText({
    super.key,
    required this.myText,
    required this.myTextColor,
    required this.fontSize,
    required this.fontWeight,
    required this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        myText,
        textAlign: align,
        style: TextStyle(
          color: myTextColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
