import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomTextWidget({required this.text, this.color, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: fontSize,
            color: color ?? Colors.white,
            fontWeight: fontWeight));
  }
}
