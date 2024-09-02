import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/common_strings.dart';

class AppColorPalette {
  final Color whiteColor;
  final Color transparentColor;
  final Color backgroundColor;
  final Color black;
  final Color grey;
  final Color hintGrey;
  final Color liteGrey;
  final Color txtLiteGrey;
  final Color skyBlue;
  final Color redDark;
  final Color red;
  final Color lightBlue;
  final Color orange;
  final Color bottomLine;
  final Color greyBorderTrangle;
  final Color blue;

  final LinearGradient bgGradient;

  AppColorPalette({
    required this.whiteColor,
    required this.backgroundColor,
    required this.transparentColor,
    required this.black,
    required this.liteGrey,
    required this.txtLiteGrey,
    required this.grey,
    required this.hintGrey,
    required this.bgGradient,
    required this.skyBlue,
    required this.redDark,
    required this.red,
    required this.lightBlue,
    required this.orange,
    required this.bottomLine,
    required this.greyBorderTrangle,
    required this.blue,
  });
}

AppColorPalette lightColorPalette = AppColorPalette(
    transparentColor: Colors.transparent,
    backgroundColor: const Color(0xFFFFFFFF),
    whiteColor: Colors.white,
    black: const Color(0xFF575665),
    grey: const Color(0xFF9AA1AB),
    liteGrey: const Color(0xFFEDEDED),
    hintGrey: const Color(0xFF9593A2),
    txtLiteGrey: const Color(0xFF777681),
    skyBlue: const Color(0xFF00ACDB),
    redDark: const Color(0xFFF51F1F),
    red: const Color(0xFFFF0000),
    lightBlue: const Color(0xFFF3F6F9),
    orange: const Color(0xFFEF5B29),
    greyBorderTrangle: const Color(0xFF4B4A52),
    bottomLine: const Color(0xFFDCDCDC),
    blue: const Color(0xFF003F79),
    bgGradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF00ACDB), Color(0xFF003F79)],
    ));

BoxDecoration decorationSendTextField() {
  return BoxDecoration(
      color: lightColorPalette.transparentColor,
      borderRadius: BorderRadius.circular(10.r));
}

BoxDecoration decorationSendMessageTextField(
    {bool isSelected = false, bool isError = false}) {
  return BoxDecoration(
      color: lightColorPalette.transparentColor,
      borderRadius: BorderRadius.circular(10.r),
      shape: BoxShape.rectangle,
      border: Border.all(
          color: isError
              ? lightColorPalette.redDark
              : (isSelected
                  ? lightColorPalette.black
                  : lightColorPalette.black.withOpacity(0.90)),
          width: isSelected ? 1 : (isError ? 1 : 0.3)));
}

class CustomTextTheme {
  static TextStyle extraBigTitleStyle(
      {Color? color,
      FontWeight? fontWeight,
      double? textSize,
      double? height}) {
    return TextStyle(
      fontSize: textSize ?? 20.sp,
      fontWeight: fontWeight ?? FontWeight.w700,
      fontFamily: CommonStrings.raleway,
      color: color ?? lightColorPalette.black,
      // height: height ?? 1.3.w,
      height: height ?? 1.w,

      //   letterSpacing: 2
    );
  }

  static TextStyle bigTitleStyle(
      {Color? color,
      FontWeight? fontWeight,
      double? textSize,
      double? height}) {
    return TextStyle(
      fontSize: textSize ?? 17.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontFamily: CommonStrings.raleway,
      color: color ?? lightColorPalette.black,
      // height: height ?? 1.3.w,
      height: height ?? 1.w,

      //   letterSpacing: 2
    );
  }

  static TextStyle normalTextStyle(
      {Color? color,
      FontWeight? fontWeight,
      double? textSize,
      bool underscore = false,
      double? height}) {
    return TextStyle(
        fontSize: textSize ?? 13.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: CommonStrings.raleway,
        color: color ?? lightColorPalette.black,
        // height: height ?? 1.3.w,
        height: height ?? 1.w,
        decorationStyle: underscore ? TextDecorationStyle.solid : null,
        decoration: underscore ? TextDecoration.underline : null,
        decorationColor: underscore ? Colors.white : color);
  }

  static TextStyle normalTextStyleWithoutDynamicSize(
      {Color? color,
      FontWeight? fontWeight,
      double? textSize,
      bool underscore = false,
      double? height}) {
    return TextStyle(
        fontSize: textSize ?? 13,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: CommonStrings.raleway,
        color: color ?? lightColorPalette.black,
        // height: height ?? 1.3.w,
        height: height ?? 1,
        decorationStyle: underscore ? TextDecorationStyle.solid : null,
        decoration: underscore ? TextDecoration.underline : null,
        decorationColor: underscore ? Colors.white : color);
  }

  static TextStyle headingTextStyle(
      {Color? color,
      FontWeight? fontWeight,
      double? textSize,
      bool underscore = false,
      double? height}) {
    return TextStyle(
        fontSize: textSize ?? 15.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: CommonStrings.raleway,
        color: color ?? lightColorPalette.black,
        // height: height ?? 1.3.w,
        height: height ?? 1.w,
        decorationStyle: underscore ? TextDecorationStyle.solid : null,
        decoration: underscore ? TextDecoration.underline : null,
        decorationColor: underscore ? Colors.white : color);
  }

  static TextStyle headingTextStyleWithoutDynamicSize(
      {Color? color,
      FontWeight? fontWeight,
      double? textSize,
      bool underscore = false,
      double? height}) {
    return TextStyle(
        fontSize: textSize ?? 15,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: CommonStrings.raleway,
        color: color ?? lightColorPalette.black,
        // height: height ?? 1.3.w,
        height: height ?? 1,
        decorationStyle: underscore ? TextDecorationStyle.solid : null,
        decoration: underscore ? TextDecoration.underline : null,
        decorationColor: underscore ? Colors.white : color);
  }
}
