import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glowvy/Utils/app_theme.dart';

class AppFontStyles{
  static TextStyle titleBold({
    Color? color,
    double fontSize = 32,
    TextDecoration decoration = TextDecoration.none,
    Color decorationColor = Colors.black,
    FontWeight fontWeight = FontWeight.w700
  }) {
    return TextStyle(
      fontFamily: 'InterBold',
      color: color ?? AppTheme.black,
      decoration: decoration,
      decorationColor: decorationColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  static TextStyle titleRegular({
    Color? color,
    double fontSize = 32,
    TextDecoration decoration = TextDecoration.none,
    Color decorationColor = Colors.black,
  }) {
    return TextStyle(
      fontFamily: 'InterRegular',
      color: color ?? AppTheme.black,
      decoration: decoration,
      decorationColor: decorationColor,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
    );
  }

  static TextStyle titleMedium({
    Color? color,
    double fontSize = 32,
    TextDecoration decoration = TextDecoration.none,
    Color decorationColor = Colors.black,
  }) {
    return TextStyle(
      fontFamily: 'InterMedium',
      color: color ?? AppTheme.black,
      decoration: decoration,
      decorationColor: decorationColor,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
    );
  }

  static TextStyle titleSemiBold({
    Color? color,
    double fontSize = 32,
    TextDecoration decoration = TextDecoration.none,
    Color decorationColor = Colors.black,
  }) {
    return TextStyle(
      fontFamily: 'InterSemiBold',
      color: color ?? AppTheme.black,
      decoration: decoration,
      decorationColor: decorationColor,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
    );
  }


}