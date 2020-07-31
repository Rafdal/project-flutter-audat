import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/frontend/classes/AudatButtonData.dart';
import 'package:test_flutter_websockets/frontend/widgets/AudatSwitchButton.dart';


class AudatIconSwitch extends StatelessWidget {

  AudatIconSwitch({Key key, 
    @required this.value,
    @required this.onChanged,
    this.onPressed, 
    this.activeIcon, 
    this.inactiveIcon, 
    this.activeText, 
    this.inactiveText, 
    this.iconSize = 30,
    this.activeColor = Colors.lightBlueAccent,
    this.inactiveColor = Colors.grey,
    this.backgroundActive = Colors.white,
    this.backgroundInactive = Colors.white,
    this.splash = Colors.lightBlueAccent,
    this.activeSplash,
    this.radius = 15,
    this.paddingExt = EdgeInsets.zero,
    this.paddingInt = EdgeInsets.zero,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final VoidCallback onPressed;
  final ValueChanged<bool> onChanged;
  final String inactiveText, activeText;
  final IconData inactiveIcon, activeIcon;
  final Color activeColor, inactiveColor, splash, activeSplash, backgroundActive, backgroundInactive;
  final double iconSize;
  final double radius;
  final bool value;
  final EdgeInsetsGeometry paddingExt, paddingInt;
  final FontWeight fontWeight;


  @override
  Widget build(BuildContext context) {
    return AudatSwitchButton(
      value: value,
        activeChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            activeIcon != null? Icon(activeIcon, size: iconSize, color: activeColor,) : Container(),
            activeText != null? Text(activeText) : Container(),
          ],
        ),
        inactiveChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            inactiveIcon != null? Icon(inactiveIcon, size: iconSize, color: inactiveColor,) : Container(),
            inactiveText != null ? Text(inactiveText) : Container(),
          ],
        ),
        activeBtnData: AudatButtonData(
          textColor: activeColor, 
          splash: activeSplash ?? splash, 
          radius: radius, 
          paddingExt: paddingExt, paddingInt: paddingInt,
          background: backgroundActive,
          fontWeight: fontWeight
        ),
        inactiveBtnData: AudatButtonData(
          textColor: inactiveColor, 
          splash: splash, 
          radius: radius,
          paddingExt: paddingExt, paddingInt: paddingInt,
          background: backgroundInactive,
          fontWeight: fontWeight
        ),
        onChanged: onChanged,
        onPressed: onPressed,
    );
  }
}