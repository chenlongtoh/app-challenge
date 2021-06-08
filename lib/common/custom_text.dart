import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final EdgeInsets padding;
  final TextStyle style;
  final String text;

  const CustomText(this.text, {Key key, this.padding, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical:6),
      child: Text(text, style: style),
    );
  }
}
