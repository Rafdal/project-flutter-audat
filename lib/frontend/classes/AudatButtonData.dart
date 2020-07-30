import 'package:flutter/material.dart';

class AudatButtonData {

  final EdgeInsetsGeometry paddingInt, paddingExt;
  final double radius;
  final Color textColor;
  final Color background;

  AudatButtonData({
    this.radius = 8, 
    this.paddingExt = const EdgeInsets.all(0), 
    this.paddingInt = const EdgeInsets.all(0),
    this.textColor = Colors.grey,
    this.background = Colors.white,
  });

  const AudatButtonData.only({
    this.paddingInt = const EdgeInsets.all(0),
    this.paddingExt = const EdgeInsets.all(0),
    this.radius = 8,
    this.textColor = Colors.grey,
    this.background = Colors.grey,
  });

  AudatButtonData copyWith({
    EdgeInsetsGeometry paddingInt, paddingExt,
    double radius,
    Color textColor,
    Color background,
  }) {
    return AudatButtonData.only(
      paddingInt: paddingInt ?? this.paddingInt,
      paddingExt: paddingExt ?? this.paddingExt,
      radius: radius ?? this.radius,
      textColor: textColor ?? this.textColor,
      background: background ?? this.background,
    );
  }
  
}