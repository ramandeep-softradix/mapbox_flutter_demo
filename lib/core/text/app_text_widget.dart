import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLine;

  const AppTextWidget({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines:maxLine ,
    );
  }
}

