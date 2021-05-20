import 'package:flutter/material.dart';

class CustomizeText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color color;
  CustomizeText({
    @required this.title,
    this.fontSize = 20,
    this.fontWeight: FontWeight.w400,
    this.textAlign: TextAlign.center,
    this.color: Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: this.color,
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
      ),
    );
  }
}
