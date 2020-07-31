import 'package:flutter/material.dart';

class AudatButtonData {

  final EdgeInsetsGeometry paddingInt, paddingExt;
  final double radius;
  final double textSize;
  final Color textColor;
  final Color background;
  final Color splash;
  final bool outlined;
  final FontWeight fontWeight;

  AudatButtonData({
    this.radius = 8, 
    this.textSize = 18, 
    this.paddingExt = const EdgeInsets.all(0), 
    this.paddingInt = const EdgeInsets.all(0),
    this.textColor = Colors.grey,
    this.background = Colors.white,
    this.splash = Colors.white,
    this.outlined = false,
    this.fontWeight = FontWeight.normal,
  });

  const AudatButtonData.only({
    this.paddingInt = const EdgeInsets.all(0),
    this.paddingExt = const EdgeInsets.all(0),
    this.radius = 8,
    this.textSize = 18,
    this.textColor = Colors.grey,
    this.background = Colors.white,
    this.splash = Colors.white,
    this.outlined = false,
    this.fontWeight = FontWeight.normal,
  });

  AudatButtonData copyWith({
    EdgeInsetsGeometry paddingInt, paddingExt,
    double radius,
    double textSize,
    Color textColor,
    Color background,
    Color splash,
    Color outlined,
    FontWeight fontWeight,
  }) {
    return AudatButtonData.only(
      paddingInt: paddingInt ?? this.paddingInt,
      paddingExt: paddingExt ?? this.paddingExt,
      radius: radius ?? this.radius,
      textSize: textSize ?? this.textSize,
      textColor: textColor ?? this.textColor,
      background: background ?? this.background,
      splash: splash ?? this.splash,
      outlined: outlined ?? this.outlined,
      fontWeight: fontWeight ?? this.fontWeight,
    );
  }
  
}