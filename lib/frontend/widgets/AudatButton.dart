import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/frontend/classes/AudatButtonData.dart';

class AudatButton extends StatelessWidget {
  AudatButton({Key key, 
    @required this.onPressed, 
    this.onLongPress, 
    this.child, 
    @required this.audatButtonData,
  }) : super(key: key);

  final VoidCallback onPressed, onLongPress;
  final Widget child;
  final AudatButtonData audatButtonData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: audatButtonData == null ? EdgeInsets.all(0) : audatButtonData.paddingExt, // : 
      child: RawMaterialButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: Padding(
          padding: audatButtonData == null ? EdgeInsets.all(0) : audatButtonData.paddingInt, // : 
          child: child,
        ),
        constraints: BoxConstraints(minHeight: 0, minWidth: 0),
        textStyle: TextStyle(
          color: audatButtonData == null ? Colors.grey : audatButtonData.textColor,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          fontSize: audatButtonData == null ? 22 : audatButtonData.textSize
        ),
        fillColor: audatButtonData == null ? Colors.white : audatButtonData.background, // audatButtonData.radius ??
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(audatButtonData == null ? 8 : audatButtonData.radius), 
          side: BorderSide(color: Colors.grey, style: audatButtonData.outlined? BorderStyle.solid : BorderStyle.none)
        ),
      ),
    );
  }
}