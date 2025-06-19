import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color strokeColor;
  final Color fillColor;
  final double strokeWidth;
  final TextAlign textAlign;

  const StrokeText(
    this.text, {
    super.key,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
    this.strokeColor = Colors.black,
    this.fillColor = const Color(0xFFFF6F00),
    this.strokeWidth = 1.5,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fillColor,
          ),
        ),
      ],
    );
  }
}
